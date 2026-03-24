import math
from dataclasses import dataclass
from typing import Dict, Tuple, Optional
import cv2
import numpy as np
import matplotlib.pyplot as plt



np.set_printoptions(precision=4, suppress=True)
plt.rcParams["figure.figsize"] = (6, 4)
plt.rcParams["image.cmap"] = "gray"

rng = np.random.default_rng(42)

@dataclass
class Keypoint:
    octave_index: int
    s_index: int
    y: float
    x: float
    sigma: float
    orientation: Optional[float] = None

def to_gray_float32(img):
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY).astype(np.float32)
    return gray

def imshow(img: np.ndarray, title: str = "", ax=None):
    if ax is None:
        fig, ax = plt.subplots()
    ax.imshow(img, cmap="gray")
    ax.set_axis_off()
    if title:
        ax.set_title(title)

def draw_keypoints(img: np.ndarray, kps, color=(0,1,0), scale=1.0):
    if img.ndim == 2:
        show = np.dstack([img, img, img])
    else:
        show = img.copy()
        if show.max() <= 1.0: show = (show * 255).astype(np.uint8)
    show = show.copy()
    H, W = img.shape[:2]
    for kp in kps:
        y, x = kp.y, kp.x
        r = 2.0 * scale
        y0 = int(round(y)); x0 = int(round(x))
        y1 = y0 + int(round(r * (-math.sin(kp.orientation or 0.0))))
        x1 = x0 + int(round(r * ( math.cos(kp.orientation or 0.0))))
        if 0 <= y0 < H and 0 <= x0 < W:
            show[y0, x0] = (np.array(color) * 255).astype(np.uint8)
        if 0 <= y1 < H and 0 <= x1 < W:
            show[y1, x1] = (np.array([1,0,0]) * 255).astype(np.uint8)
    imshow(show)


def pairwise_distances_squared(A: np.ndarray, B: np.ndarray) -> np.ndarray:
    AA = np.sum(A*A, axis=1, keepdims=True)
    BB = np.sum(B*B, axis=1, keepdims=True).T
    M = AA + BB - 2.0 * (A @ B.T)
    return np.maximum(M, 0.0).astype(np.float32)

def match_descriptors(desc1: np.ndarray, desc2: np.ndarray, ratio: float = 0.8):
    if desc1 is None or desc2 is None:
        return []
    if desc1.size == 0 or desc2.size == 0:
        return []

    D2 = pairwise_distances_squared(desc1.astype(np.float32), desc2.astype(np.float32))
    N1, N2 = D2.shape

    nn = np.argmin(D2, axis=1)
    d1 = D2[np.arange(N1), nn]

    if N2 >= 2:
        idx_sorted = np.argsort(D2, axis=1)
        nn2 = idx_sorted[:, 1]
        d2 = D2[np.arange(N1), nn2]
        keep = d1 < (ratio * ratio) * d2
    else:
        keep = np.ones(N1, dtype=bool)

    cand = [(int(i), int(nn[i]), float(np.sqrt(d1[i]))) for i in range(N1) if keep[i]]

    cand.sort(key=lambda t: t[2])
    used_j = set()
    matches = []
    for i, j, dist in cand:
        if j in used_j:
            continue
        used_j.add(j)
        matches.append((i, j, dist))

    return matches

def show_matches(img1: np.ndarray, kps1: list[Keypoint],
                 img2: np.ndarray, kps2: list[Keypoint],
                 matches: list[Tuple[int,int,float]], max_show: int = 200):
    if img1.ndim == 2: img1c = np.dstack([img1]*3)
    else: img1c = img1
    if img2.ndim == 2: img2c = np.dstack([img2]*3)
    else: img2c = img2

    if img1c.max() <= 1.0: img1c = (img1c*255).astype(np.uint8)
    if img2c.max() <= 1.0: img2c = (img2c*255).astype(np.uint8)

    H = max(img1c.shape[0], img2c.shape[0])
    W = img1c.shape[1] + img2c.shape[1]
    canvas = np.zeros((H, W, 3), dtype=np.uint8)
    canvas[:img1c.shape[0], :img1c.shape[1]] = img1c
    canvas[:img2c.shape[0], img1c.shape[1]:] = img2c

    def rnd_color():
        c = rng.integers(64, 255, size=3)
        return (int(c[0]), int(c[1]), int(c[2]))

    if cv2 is None:
        plt.figure(figsize=(10, 6))
        imshow(canvas)
        plt.show()
        return

    for (i, j, _) in matches[:max_show]:
        y1, x1 = int(round(kps1[i].y)), int(round(kps1[i].x))
        y2, x2 = int(round(kps2[j].y)), int(round(kps2[j].x))
        color = rnd_color()
        cv2.circle(canvas, (x1, y1), 2, color, 1, lineType=cv2.LINE_AA)
        cv2.circle(canvas, (x2 + img1c.shape[1], y2), 2, color, 1, lineType=cv2.LINE_AA)
        cv2.line(canvas, (x1, y1), (x2 + img1c.shape[1], y2), color, 1, lineType=cv2.LINE_AA)

    plt.figure(figsize=(12, 6))
    plt.imshow(canvas)
    plt.axis("off")
    plt.show()



@dataclass
class ImageFeatures:
    xy: np.ndarray
    desc: np.ndarray
    img_gray: np.ndarray
    img_rgb:  np.ndarray

def _kps_to_image_xy(kps: list['Keypoint']) -> np.ndarray:
    xy = []
    for kp in kps:
        scale = (2.0 ** kp.octave_index)
        xy.append([kp.x * scale, kp.y * scale])
    return np.asarray(xy, dtype=np.float32)

def _extract_features_single(img: np.ndarray, sift_fn) -> ImageFeatures:
    if img.ndim == 2:
        gray = to_gray_float32(img)
        rgb = np.dstack([gray, gray, gray])
    else:
        rgb = img.astype(np.float32)
        if rgb.max() > 1.5:
            rgb = rgb / 255.0
        gray = to_gray_float32(rgb)

    params = {'octaves': max(1, int(np.floor(np.log2(min(*gray.shape)))) - 3),
        'S': 3,
        'sigma0': 1.6,
        'sigma_in': 0.5,
        'pad': 'mirror'
    }
    kps, desc = sift_fn(gray, params)
    xy = _kps_to_image_xy(kps)
    return ImageFeatures(xy=xy, desc=desc, img_gray=gray, img_rgb=rgb.astype(np.float32))

def extract_features_for_images(images: list[np.ndarray], sift_fn) -> list[ImageFeatures]:
    return [_extract_features_single(img, sift_fn) for img in images]

def _to_h(xy: np.ndarray) -> np.ndarray:
    return np.hstack([xy.astype(np.float32), np.ones((xy.shape[0], 1), dtype=np.float32)])

def _from_h(xyh: np.ndarray) -> np.ndarray:
    w = np.maximum(1e-12, xyh[:, 2:3])
    return xyh[:, :2] / w

def _normalize_points(pts: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    c = pts.mean(axis=0)
    d = np.sqrt(((pts - c) ** 2).sum(axis=1)).mean()
    s = (np.sqrt(2.0) / max(1e-12, d))
    T = np.array([[s, 0, -s*c[0]],
                  [0, s, -s*c[1]],
                  [0, 0,      1 ]], dtype=np.float32)
    pts_h = _to_h(pts)
    pts_n = _from_h((T @ pts_h.T).T)
    return T, pts_n

def _dlt_homography(src: np.ndarray, dst: np.ndarray) -> np.ndarray:
    assert src.shape[0] >= 4 and src.shape == dst.shape
    Tsrc, src_n = _normalize_points(src)
    Tdst, dst_n = _normalize_points(dst)
    A = []
    for (x, y), (u, v) in zip(src_n, dst_n):
        A.append([0, 0, 0, -x, -y, -1,  v*x,  v*y,  v])
        A.append([x, y, 1,  0,  0,  0, -u*x, -u*y, -u])
    A = np.asarray(A, dtype=np.float32)
    _, _, VT = np.linalg.svd(A, full_matrices=False)
    h = VT[-1, :]
    Hn = h.reshape(3, 3)
    H = np.linalg.inv(Tdst) @ Hn @ Tsrc
    if abs(H[2,2]) > 1e-12:
        H = H / H[2,2]
    return H

def _reproj_errors(H: np.ndarray, src: np.ndarray, dst: np.ndarray) -> np.ndarray:
    proj = _from_h((_to_h(src) @ H.T))
    return np.linalg.norm(proj - dst, axis=1)

import math
import numpy as np

def _safe_log1m(x: float, eps: float = 1e-12) -> float:
    x = min(max(float(x), 0.0), 1.0 - eps)
    return math.log(1.0 - x)

def ransac_homography(
    src: np.ndarray,
    dst: np.ndarray,
    thresh_px: float = 3.0,
    max_iters: int = 2000,
    confidence: float = 0.999,
    min_samples: int = 4,
):
    N = int(src.shape[0])
    if N < min_samples:
        return None, np.zeros(N, dtype=bool)

    best_H = None
    best_inliers = np.zeros(N, dtype=bool)
    best_cnt = 0

    iters = max_iters
    i = 0
    rng_local = np.random.default_rng(12345)

    while i < iters:
        i += 1
        idx = rng_local.choice(N, size=min_samples, replace=False)
        Hc = _dlt_homography(src[idx], dst[idx])
        if not np.all(np.isfinite(Hc)):
            continue

        errs = _reproj_errors(Hc, src, dst)
        inl = errs < thresh_px
        m = int(inl.sum())
        if m > best_cnt:
            best_cnt = m
            best_inliers = inl
            best_H = Hc
            w = m / float(N)
            if w >= 1.0 - 1e-6:
                iters = min(iters, 1)
            else:
                wk = min(1.0 - 1e-12, max(1e-12, w ** min_samples))
                num = _safe_log1m(confidence)
                den = _safe_log1m(wk)
                if not np.isfinite(den) or abs(den) < 1e-12:
                    new_iters = 1
                else:
                    new_iters = int(num / den + 1)
                iters = min(max_iters, max(1, new_iters))

    if best_H is None or best_cnt < min_samples:
        return None, np.zeros(N, dtype=bool)

    H_ref = _dlt_homography(src[best_inliers], dst[best_inliers])
    return H_ref, best_inliers

def _warp_perspective_numpy(img: np.ndarray, H: np.ndarray, out_size: Tuple[int, int]) -> np.ndarray:
    W_out, H_out = out_size
    Hinv = np.linalg.inv(H).astype(np.float32)

    yy, xx = np.meshgrid(np.arange(H_out, dtype=np.float32),
                         np.arange(W_out, dtype=np.float32),
                         indexing='ij')
    ones = np.ones_like(xx)
    grid = np.stack([xx, yy, ones], axis=-1).reshape(-1, 3)
    src = (grid @ Hinv.T)
    src_x = (src[:, 0] / np.maximum(1e-12, src[:, 2])).reshape(H_out, W_out)
    src_y = (src[:, 1] / np.maximum(1e-12, src[:, 2])).reshape(H_out, W_out)

    x0 = np.floor(src_x).astype(np.int32); x1 = x0 + 1
    y0 = np.floor(src_y).astype(np.int32); y1 = y0 + 1

    Hs, Ws = img.shape[:2]
    x0c = np.clip(x0, 0, Ws-1); x1c = np.clip(x1, 0, Ws-1)
    y0c = np.clip(y0, 0, Hs-1); y1c = np.clip(y1, 0, Hs-1)

    wx = src_x - x0; wy = src_y - y0
    w00 = (1 - wx) * (1 - wy)
    w01 = (1 - wx) * wy
    w10 = wx * (1 - wy)
    w11 = wx * wy

    if img.ndim == 2:
        I00 = img[y0c, x0c]
        I01 = img[y1c, x0c]
        I10 = img[y0c, x1c]
        I11 = img[y1c, x1c]
        out = I00*w00 + I01*w01 + I10*w10 + I11*w11
    else:
        I00 = img[y0c, x0c, :]
        I01 = img[y1c, x0c, :]
        I10 = img[y0c, x1c, :]
        I11 = img[y1c, x1c, :]
        w00c = w00[..., None]; w01c = w01[..., None]
        w10c = w10[..., None]; w11c = w11[..., None]
        out = I00*w00c + I01*w01c + I10*w10c + I11*w11c

    return out.astype(np.float32)

def _warp_with_mask(img: np.ndarray, H: np.ndarray, out_wh: Tuple[int, int]) -> Tuple[np.ndarray, np.ndarray]:
    W, Hh = out_wh
    if cv2 is not None:
        warped = cv2.warpPerspective(img, H, (W, Hh), flags=cv2.INTER_LINEAR,
                                     borderMode=cv2.BORDER_CONSTANT, borderValue=0)
        ones = np.ones((img.shape[0], img.shape[1]), dtype=np.float32)
        mask = cv2.warpPerspective(ones, H, (W, Hh), flags=cv2.INTER_NEAREST,
                                   borderMode=cv2.BORDER_CONSTANT, borderValue=0)
        return warped.astype(np.float32), mask.astype(np.float32)
    else:
        warped = _warp_perspective_numpy(img, H, (W, Hh))
        ones = np.ones((img.shape[0], img.shape[1]), dtype=np.float32)
        mask = _warp_perspective_numpy(ones, H, (W, Hh))
        mask = (mask > 0.5).astype(np.float32)
        return warped, mask
    
def gaussian_kernel_1d(sigma: float, radius: Optional[int] = None) -> np.ndarray:
    assert sigma > 0
    if radius is None:
        radius = int(np.ceil(3.0 * sigma))
    x = np.arange(-radius, radius + 1, dtype=np.float32)
    k = np.exp(-(x * x) / (2.0 * sigma * sigma))
    k /= k.sum()
    return k.astype(np.float32)

def convolve1d_reflect(arr: np.ndarray, kernel: np.ndarray, axis: int) -> np.ndarray:
    r = kernel.size // 2
    pad_width = [(0,0)] * arr.ndim
    pad_width[axis] = (r, r)
    padded = np.pad(arr, pad_width, mode="reflect")
    axes = list(range(arr.ndim))
    axes[axis], axes[-1] = axes[-1], axes[axis]
    trans = np.transpose(padded, axes)
    out = np.empty_like(trans[..., r:-r])
    for i in range(out.shape[-1]):
        sl = trans[..., i:i+kernel.size]
        out[..., i] = np.tensordot(sl, kernel, axes=([-1],[0]))
    out = np.transpose(out, axes)
    return out

def gaussian_blur(img: np.ndarray, sigma: float, *args, **kwargs) -> np.ndarray:
    k = gaussian_kernel_1d(sigma)
    tmp = convolve1d_reflect(img, k, axis=1)
    out = convolve1d_reflect(tmp, k, axis=0)
    return out.astype(np.float32)

def _soften_mask(mask: np.ndarray, sigma: float) -> np.ndarray:
    if sigma <= 0:
        return mask.astype(np.float32)
    base = mask if mask.ndim == 2 else mask[..., 0]
    sm = gaussian_blur(base.astype(np.float32), sigma)
    mmin, mmax = float(sm.min()), float(sm.max())
    if mmax - mmin < 1e-8:
        return (sm > 0).astype(np.float32)
    return ((sm - mmin) / (mmax - mmin)).astype(np.float32)

def _estimate_pair_h(
    feats_i: ImageFeatures,
    feats_j: ImageFeatures,
    ratio: float,
    ransac_thresh: float,
    ransac_iters: int
) -> Tuple[Optional[np.ndarray], int]:
    matches = match_descriptors(feats_i.desc, feats_j.desc, ratio=ratio)
    if len(matches) < 4:
        return None, 0
    idx_i = np.array([ii for (ii, _, _) in matches], dtype=np.int32)
    idx_j = np.array([jj for (_, jj, _) in matches], dtype=np.int32)
    src = feats_i.xy[idx_i]
    dst = feats_j.xy[idx_j]
    H, inliers = ransac_homography(src, dst, thresh_px=ransac_thresh, max_iters=ransac_iters)
    if H is None:
        return None, 0
    return H, int(inliers.sum())

def build_pairwise_graph(
    feats: list[ImageFeatures],
    ratio: float = 0.75,
    ransac_thresh: float = 3.0,
    ransac_iters: int = 2000,
    min_matches_to_link: int = 15
) -> Dict[Tuple[int,int], Dict[str, object]]:
    n = len(feats)
    edges: Dict[Tuple[int,int], Dict[str, object]] = {}
    for i in range(n):
        for j in range(i+1, n):
            H_ji, m = _estimate_pair_h(feats[i], feats[j], ratio, ransac_thresh, ransac_iters)
            if H_ji is None or m < min_matches_to_link:
                H_ij, m2 = _estimate_pair_h(feats[j], feats[i], ratio, ransac_thresh, ransac_iters)
                if H_ij is None or m2 < min_matches_to_link:
                    continue
                try:
                    H_ji = np.linalg.inv(H_ij).astype(np.float32)
                except np.linalg.LinAlgError:
                    continue
                m = m2
            try:
                H_ij = np.linalg.inv(H_ji).astype(np.float32)
            except np.linalg.LinAlgError:
                continue
            edges[(i, j)] = {"H_j_i": H_ji, "H_i_j": H_ij, "inliers": m}
    return edges

def connected_components(n: int, edges: Dict[Tuple[int,int], Dict[str, object]]) -> list[list[int]]:
    adj = [[] for _ in range(n)]
    for (i, j) in edges.keys():
        adj[i].append(j)
        adj[j].append(i)
    seen = [False] * n
    comps: list[list[int]] = []
    for s in range(n):
        if seen[s]:
            continue
        # BFS
        q = [s]
        seen[s] = True
        comp = [s]
        while q:
            v = q.pop(0)
            for u in adj[v]:
                if not seen[u]:
                    seen[u] = True
                    q.append(u)
                    comp.append(u)
        comps.append(sorted(comp))
    comps = [c for c in comps if len(c) >= 2]
    return comps

def stitch_component(
    feats: list[ImageFeatures],
    comp_indices: list[int],
    edges: Dict[Tuple[int,int], Dict[str, object]],
    blend_sigma: float = 12.0
) -> Dict[str, object]:

    comp = sorted(comp_indices)
    deg = {i: 0 for i in comp}
    for (i, j), info in edges.items():
        if i in comp and j in comp:
            deg[i] += 1; deg[j] += 1
    ref = max(comp, key=lambda x: deg[x])

    def get_H(dst: int, src: int) -> Optional[np.ndarray]:
        a, b = (min(dst, src), max(dst, src))
        e = edges.get((a, b))
        if e is None:
            return None
        if (dst, src) == (a, b):
            return e["H_b_a"].astype(np.float32) if "H_b_a" in e else e["H_j_i"].astype(np.float32)
        else:
            return e["H_a_b"].astype(np.float32) if "H_a_b" in e else e["H_i_j"].astype(np.float32)

    for k, v in list(edges.items()):
        i, j = k
        v["H_b_a"] = v["H_j_i"]
        v["H_a_b"] = v["H_i_j"]

    transforms: Dict[int, np.ndarray] = {ref: np.eye(3, dtype=np.float32)}
    placed = {ref}
    queue = [ref]
    while queue:
        j = queue.pop(0)
        for i in comp:
            if i in placed or i == j:
                continue
            H_j_i = get_H(j, i)
            if H_j_i is None:
                continue
            transforms[i] = transforms[j] @ H_j_i
            placed.add(i)
            queue.append(i)

    placed_list = sorted(list(placed))
    failed = [i for i in comp if i not in placed]

    if len(placed_list) < 2:
        return {"panorama": None, "placed_indices": placed_list, "failed_indices": failed, "transforms": transforms}

    corners = []
    for idx in placed_list:
        Hh, Wh = feats[idx].img_rgb.shape[:2]
        cs = np.array([[0,0], [Wh,0], [Wh,Hh], [0,Hh]], dtype=np.float32)
        cs_ref = _from_h(_to_h(cs) @ transforms[idx].T)
        corners.append(cs_ref)
    all_xy = np.vstack(corners)
    pad = 20.0
    min_x = float(np.floor(all_xy[:,0].min() - pad))
    max_x = float(np.ceil (all_xy[:,0].max() + pad))
    min_y = float(np.floor(all_xy[:,1].min() - pad))
    max_y = float(np.ceil (all_xy[:,1].max() + pad))

    tx, ty = (-min_x, -min_y)
    T_off = np.array([[1, 0, tx],
                      [0, 1, ty],
                      [0, 0,  1]], dtype=np.float32)
    W_out = int(max(1, round(max_x - min_x)))
    H_out = int(max(1, round(max_y - min_y)))

    acc = np.zeros((H_out, W_out, 3), dtype=np.float32)
    wsum = np.zeros((H_out, W_out), dtype=np.float32)

    for idx in placed_list:
        img = feats[idx].img_rgb
        H_ref_i = T_off @ transforms[idx]
        warped, mask = _warp_with_mask(img, H_ref_i, (W_out, H_out))
        soft = _soften_mask(mask, sigma=blend_sigma)
        acc += warped * soft[..., None]
        wsum += soft

    pano = acc / np.maximum(1e-8, wsum[..., None])
    pano = np.clip(pano, 0.0, 1.0).astype(np.float32)

    return {"panorama": pano,
            "placed_indices": placed_list,
            "failed_indices": failed,
            "transforms": transforms}

def assemble_and_show_all_collages(
    images: list[np.ndarray],
    sift_fn,
    ratio: float = 0.75,
    ransac_thresh: float = 3.0,
    ransac_iters: int = 2000,
    min_matches_to_link: int = 15,
    blend_sigma: float = 12.0,
    max_cols: int = 2
) -> list[Dict[str, object]]:
    assert len(images) > 0, "Нужен непустой список изображений"
    feats = extract_features_for_images(images, sift_fn)
    edges = build_pairwise_graph(
        feats, ratio=ratio, ransac_thresh=ransac_thresh,
        ransac_iters=ransac_iters, min_matches_to_link=min_matches_to_link
    )
    comps = connected_components(len(feats), edges)
    if len(comps) == 0:
        print("Не найдено ни одной связной компоненты размера ≥ 2. Проверьте пороги и перекрытия.")
        return []

    results: list[Dict[str, object]] = []
    for comp in comps:
        res = stitch_component(feats, comp, edges, blend_sigma=blend_sigma)
        results.append(res)

    n = len(results)
    cols = min(max_cols, n)
    rows = (n + cols - 1) // cols
    plt.figure(figsize=(10 * cols, 6 * rows))
    for k, res in enumerate(results, 1):
        plt.subplot(rows, cols, k)
        if res["panorama"] is None:
            plt.text(0.5, 0.5, f"Компонента {k}: недостаточно связей",
                     ha="center", va="center", fontsize=14)
            plt.axis("off")
            continue
        plt.imshow(res["panorama"])
        plt.axis("off")
        title = f"Коллаж {k} • кадры {res['placed_indices']}"
        if res["failed_indices"]:
            title += f" (не вошли: {res['failed_indices']})"
        plt.title(title)
    plt.tight_layout()
    plt.show()

    return results