### Topic: Review

**Definition.** Let $F \geq 0$ denote fixed costs (independent of quantity $q$), and $VC(q) \geq 0$ denote the variable cost of producing quantity $q$.

>[!note]
It is assumed that the function $VC$ is continuous at $q = 0$ and $VC(0) = 0$.

**Definition.** The total cost of producing quantity $q$ is given by:
$$C(q) = F + VC(q)$$

**Definition.** The marginal (incremental) cost for quantity $q$ is:
$$MC(q) = C'(q) = VC'(q)$$
(When taking the derivative of the $C(q), F$ gets destroyed, as fixed costs are constant no matter how much is produced.)

**Definition.** The average costs (AC) and average variable costs (AVC) for quantity $q > 0$ are:
$$AC(q) = \frac{C(q)}{q} \quad \text{and} \quad AVC(q) = \frac{VC(q)}{q}$$

![test](https://drive.google.com/drive/u/1/folders/1-DyqyjR2-KR3X5_lR7zdthq6qtatRXAt)

>[!note]
The $MC$ curve intersects the $AC$ and $AVC$ curves at their minimums (at interior points).

**Definition.** Fixed costs $F$ can be further decomposed into **sunk costs** and **avoidable fixed costs.**

**Definition.** The total cost of producing quantity $q$ is given by:
$$C(q) = \begin{cases} S & q = 0 \\ F + VC(q) & q > 0 \end{cases}$$
where:
$S$ is the sunk cost part of fixed costs ($S \leq F$)
$F - S$ is the avoidable part of fixed costs

>[!note]
Teachers sometimes assume that $S = F$.

>[!note]
There will be an upcoming task where if you are unable to find the the fixed costs, it is recommended you draw the cost function $c(q)$. 

### Topic:Perfect Competition

**Definition.** A perfectly competitive market is an ideal (a benchmark) against which other models/markets are compared.

Main assumptions of perfect competition:
- Homogeneous good
- Perfectly divisible output
- Perfect information 
- No transaction costs
- No externalities 
- Price-taking behavior 

>[!note]
Perfectly competitive markets are rarely observed in the real world (if ever). 

**Definition.** The firm's profit is:
$$\pi(q) = R(q) - C(q) = p \cdot q - C(q)$$
The firm maximizes its profit $\pi(q)$ by choosing $q \geq 0$.

The firm’s decision process (a two-step process):
1.  What positive output $q$ maximizes profit?
2.  Does the firm make enough profit to cover its costs, or is it better off by shutting down ($q = 0$)?

**Step 1.** To maximize profit when $q > 0$:
$$\max_{q>0} p \cdot q - C(q)$$
First-Order Condition (FOC) (interior optimum) — price equals marginal cost at $q^* > 0$:
$$p = MC(q^*)$$

Essentially, the FOC will check if the profit function will provide us with marginal profit as the firm continues producing more product. 

The Second-Order Condition (SOC) must also be checked:
$$-MC'(q^*) \leq 0 \quad \Rightarrow \quad MC'(q^*) \geq 0$$

The SOC will ensure that not only the marginal costs ahead will be increasing, but that the marginal costs before the point are smaller than the current point.

Thus, intuitively, marginal costs must be increasing at $q^*$.

>[!warning]
If at any point your $p^* <0$, then you are doing something wrong.  

**Step 2.** The shutdown condition: it must be checked that shutting down is suboptimal:
$$\pi(q^*) \geq \pi(0) \text{ (profit with p* vs profit when shutting down)}$$
$$p \cdot q^* - F- VC(q^*) \geq -S$$
$$p \geq AVC(q^*) + \frac{F-S}{q^*} \text{ (Remember that } \frac{VC}{q}=AVC \text{)}$$
or
$$MC(q^*) \geq AVC(q^*) + \frac{F-S}{q^*}$$
Remember than the optimal price is the marginal cost of a product.

>[!note]
The price is high enough to cover all avoidable costs.
- if $S = F$ (all fixed costs are sunk), then $p \geq AVC(q^*)$
- if $S = 0$ (no sunk costs), then $p \geq AC(q^*)$

>[!note]
You can solve for $q_s$ and $p_s$ using the following equations we got previously. 
$$MC(q_s) = AVC(q_s) + \frac{F-S}{q_s}$$
$$p_s = MC(q_s)$$

![[Pasted image 20250901172916.png|center|600]]
The shutdown price $p_{s}$ can be as low as $AVC^*$ or as high as $AC^*.$ Furthermore, if some of the shutdown costs are avoidable, then shutdown costs become higher. 

A typical firm's supply - with an optimal output given any p. 
![[Pasted image 20250901173125.png|center|600]]

**Class Example 1**. Suppose the firm's total cost of producing $q$ is given by:
$$C(q) = \begin{cases} 12 & q = 0 \\ 16 + q^2 & q > 0 \end{cases}$$
Construct the firm's supply function $s(p)$.

Step 1: (finding $q^*$) 
$$p=MC(q^*) = C(q)' \text{ (FOC)} \implies p = 2q$$

