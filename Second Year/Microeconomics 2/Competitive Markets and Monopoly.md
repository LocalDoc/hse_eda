####  Topic: Competitive Markets and Monopoly
Concepts, definitions and common problems of part I of the Microeconomics II course. 

Please address all mistakes, errors, complains to [me](https://t.me/local_dan). 

>[!warning]
>The current version does not **yet** include a review of seminars 1 - 3 and the first problem set, which are parts of part I. Additional information may be added upon the completion of their review. 

---
#### Chapter 22: Firm Supply

Profit maximizing firms cannot produce an arbitrary amount of product at an arbitrary price. 

**Technological constraints:**
The production function $y(.)$ summaries the technological constraint upon a firm. (will be used to showcase the production function $y(L,K)$). Just y will be used to show const output. 

**Economic constraints:**
The cost function $c(.)$ summaries the economic constraint, and it is closely related to the technological function. (often $c(w,r)=wL +rK$)

>[!note] 
>These concepts are related through the cost minimization problem. We say that $c \rightarrow min$ occurs when the (marginal rate of subsitution) $MRTS = \frac{w}{r}=-\frac{MP_{1}(x_{1},x_{2})}{MP_{2}(x_{1}x_{2})}$.  Sometimes it is also called technical rate of subsitution (TRS). 

>[!summary] Practical appendix (cost minimization problem)
>The usual task of minimizing costs presents us with a $c=wL+rK\rightarrow min \quad s.t. y(L,K)\geq y$. We may find the (optimal) $L^*, K^*$. Often these types of problems can be solved by finding $MP_{L}, MP_{K}$, then applying the $c \rightarrow min$ condition by stating that $\frac{MP_{L}}{MP_{K}}=\frac{w}{r}$, solving for one of the production factors $(K,L)$ , substituting it (suppose K) into the technological constraint $y(L,K)\geq y$ which becomes an equation of $y(L)=y$, which can be easily solved for $L^*$. Using $L^*$ we are able to find $K^*$  and thus the optimal production factors have been found. 
>
>Alternatively, you can use LaGrange ($\mathbf{L}$). 
>You set up the $\mathbf{L}(L,K, \lambda)=wL+rK+\lambda(y-y(L,K))$, find the $(\mathbf{L})'_{L}, (\mathbf{L})'_{K},(\mathbf{L})'_{\lambda}$, equal them to $0$, as a result you would obtain two equations to $\lambda$ (from which you would solve to the to the $c -\rightarrow min$ condition, and solve for $L^*, K^*$ once again) and the original constraint that is kind of a useless loop. 

**Market constraint**
A firm can only produce as much as physically feasible (technological constraint essentially), and it set whatever price it wants, but it can only sell as much as people are willing to buy. 

**The demand curve facing the firm:**
Is the relationship between the price (p) set for a certain amount that it sells (x)

**Market environment:**
Will be used to describe the ways that firms respond to each other when they make their pricing decisions. 

**Pure competition:**
We say that a market is purely competitive if each firm assumes that the market price is independent of its own level of output. As a result the firm in a purely competitive market only worries about the y it wants to produce. Whatever is produced can only be sold for one p, the going market p. 

**Price taker:**
Someone is a price taker when the price given is as far as someone has to be concerned on the topic. 

![[Pasted image 20251214220750.png|center]]


>[!note] 
>The demand curve and the demand curve facing the firm are different. The market demand curve measures the relationship between the market price and the total amount of output sold. The demand curve facing a firm measures the relationship between the market price and the output of **that particular firm**.


**The maximization problem facing a competitive firm:** 


$$
py-c(y) \rightarrow max(y)
$$


 A competitive firm will choose to produce at $MR=MC$. Remember that for a competitive firm the marginal revenue is simply the price, thus: $\Delta R=p \Delta y\implies \frac{\Delta R}{\Delta y}=p \implies MC(y)=p$. 


If price is more than marginal cost then the firm can increase profits ($\pi$) by producing a little more $y$

$$
p - \frac{\Delta c}{\Delta y} >0
$$


So increasing a by $\Delta y$:

$$
p \Delta y - \frac{\Delta c}{\Delta y} \Delta y > 0 
$$


and by simplifying it it would become clear that we would see more revenue.  Similarly, when the price is less than marginal cost, reducing $y$ would increase the $\pi$. 



---

**Some exceptions:**

First:
There are two troublesome cases. The first case is when there are several levels of output where price equals marginal cost, such as the case depicted in Figure 22.2. Here there are two levels of output where price equals marginal cost. Which one will the firm choose? It is not hard to see the answer. Consider the first intersection, where the marginal cost curve is sloping down. Now if we increase output a little bit here, the costs of each additional unit of output will decrease. That’s what it means to say that the marginal cost curve is decreasing. But the market price will stay the same. Thus profits must definitely go up. So we can rule out levels of output where the marginal cost curve slopes downward. At those points an increase in output must always increase profits. The supply curve of a competitive firm must lie along the upward- sloping part of the marginal cost curve. This means that the supply curve itself must always be upward sloping. The “Giffen good” phenomenon cannot arise for supply curves. Price equals marginal cost is a necessary condition for profit maximization. It is not in general a sufficient condition. Just because we find a point where price equals marginal cost doesn’t mean that we’ve found the maximum profit point. But if we find the maximum profit point, we know that price must equal marginal cost.
![[Pasted image 20251214223005.png]]
> AC (Average Cost), AVC (Average variable cost)

Second:
There is always the option of doing nothing at all. We should always compare our candidate for profit maximization against the possibility of doing nothing at all ($y=0$).  

At $y=0$ the firm still has to pay its fixed costs, whilst the $\pi$ of producing at $y$ are $py-c(y)-F$. The firm will be better off going out of business if: 

$$
-F > p y - c(y) -F
$$

**Shutdown condition:**

$$
AVC(y) = \frac{c(y)}{y}>p
$$

The shutdown condition is that if AVC are greater than p, then it would be better for the firm to be producing $y=0$, which in this means that the firm might as well go out of business. 

>This indicates that the only portions of a MC curve that lie above the AVC curve are possible points on a supply curve as if the point where MC = p is under AVC, then AVC > p and the logical course of action would be to produce $y=0$. 

**Inverse supply function:**
Price as the function of output. The equation $p =MC(y)$ gives us the inverse supply function. 

**Profits and producer surplus:**

**Total Revenue (TR)**:
$TR = p^* y^*$. Self explanatory. 

**Total Costs**
In the following figure the total costs are $c(y)=y AC(y)=y\cdot \frac{c(y)}{y}$. 

> Reminder: 
> We've previously defined the Producer Surplus (PS) as the area left of the supply curve and Consumer Surplus (CS) as the area left of the demand curve. 

**Profits ($\pi$)**:

$$
\pi = py -c(y)-F
$$

**Producer Surplus: (PS)**

$$
PS = py - c(y) 
$$

The most direct way to look at the producer surplus is to look at the difference between the revenue box and the box of $y^*AVC(y^*)$.

![[Pasted image 20251215010407.png]]
> The area under the marginal cost curve manages measures the total variable cost. 


![[Pasted image 20251215013930.png]]
**The Long-run supply curve of a firm:**
The long run supply curve of a firm measures how much the firm would optimally produce when it is allowed to adjust the fixed factors of production in the short run. As a result the long run supply curve would be given by: 

$$
p = MC_{l}(y) = MC(y,k(y))
$$

And the short-run supply curve is given by price equals marginal cost at some fixed level k. 

$$
p = MC(y,k)
$$


> The short run supply curve involves the marginal cost of output holding k fixed at a given level of output, while the long-run supply curve involves the MC of $y$ when you adjust k optimally. The SR MC and LR MC coincide at $y^*$ where the fixed factor choice associated with the short-run marginal cost is the $k^*$ choice. 

![[Pasted image 20251215015344.png]]

Consider that since the, in the long run, the firm is free to adjust its inputs, it can also make the choice of remaining in or out of business. 

**Shutdown condition (SR)**

$$
py - c(y ) \geq 0\implies p \geq \frac{c(y)}{y} \implies p \geq AVC(y)
 $$


![[Pasted image 20251215021112.png]]
**Long-Run Constant** AC: 
There is a case of interest when the long-run technology of the firm exhibits const returns to scale. 
![[Pasted image 20251215021527.png]]
>[!summary] Theory summary 
>1. The relationship between the price a firm charges and the output that it sells is known as the demand curve facing the firm. By definition, a competitive firm faces a horizontal demand curve the height of which is determined by the market price (the price being charged by the other firms in the market). 
>2. The SR supply curve of a competitive firm is that portion of its SR MC curve that is upward sloping (increases value over time) and lies above the AVC curve. 
>3. The change of a PS when price changes ($p_{1}\to p_{2}$) is the area left of the MC curve between $p_{1}$ and $p_{2}$. It also changes the change in profits, as PS is profit without accounting for the fixed costs (FC or just F).
>4. The LR supply curve is the upwards sloping potion of the LR marginal cost curve that lives above the LR AVC curve. 

>[!summary] Practical  appendix (profit maxxing supply )
>The $\pi \to max$ problem is:
>
>$$
> py - c(y) \to max (y) \quad s.t. y \geq {0}
>$$
>
>The necessary conditions for the $y^*$ are the FOC: 
>
>$$
> p - c'(y^*)= 0
>$$ 
>
>And the SOC:
>$$
> -c''(y^*)\leq 0 
>$$
>The first order condition says that price is equal to MC, and the second that MC must upward sloping (presuming that $y^*>0$). To determine the supply curve of a competitive firm, we must find all the points where the FOC and SOC are satisfied, and compare them against each other and $y=0$. 

---

#### Chapter 23: Industry Supply 

**SR Industry supply:**
We allow $S_{1}(p)$ to be the supply curve of an i firm, so that the industry supply curve (also known as the market supply curve) would be: 
$$
S(p) = \sum_{i=1}^n
 S_{i}(p)$$

Geometrically: 
![[Pasted image 20251215125626.png]]

**Industry Equilibrium in the SR**
The intersection of the market supply curve and the market demand curve shows us the $p^*$. 

Armed with this $p^*$ we can go back to the individual firms and compute their individual supply and demand, profits or looses. 

![[Pasted image 20251215125936.png]]

> In general, combinations of p and y that lie under the AC curve represent negative profits, whilst those combinations of p and y that lie above the AC curve represent profits. 

**Industry Eq in the LR**
> In the long run firms are able to adjust their factors of production. 

**Free entry Industries:**
Industries where there are no restrictions on new firms entering, these industries are considered to be the most competitive. 

**Barriers to entry:**
Restrictions onto the entry into an industry.

>[!note]
>Often , for competitive markets, the level of $y^*$ where the AC are minimized, is $p^* = \frac{c(y^*)}{y^*}=AVC(y^*)$.  

Consider the following example, with several (n) firms present on the market. 
![[Pasted image 20251215132022.png]]
If we are looking for the long run supply curve then we are able to eliminate those positions under $p^*$ for the simple reason that in the long run there would be no reason for firms to produce at  $y(p^*)$. 

![[Pasted image 20251215132222.png]]

![[Pasted image 20251215132519.png]]

> The reason for this change is that for a $\Delta p$ change in price, we would see a $\Delta y$ change in output, and considering that we have n firms on the market, the market change would be of $n \Delta y$ .

**The meaning of zero profits:**
When an industry has zero profits it means that it stops growing. 

Usually free entry into an industry causes zero profit, as any potential $\pi$ is driven off until by new firms. 

**Economic rent(r):**
Economic rent is defined as those payments to a factor of production that are in excess of the minimum payment necessary to have that factor supplied. 

**Rent seeking:**
Efforts directed at keeping or acquiring claims to factors of production in fixed supplies are sometimes referred to as rent seeking. 


>[!summary] Theoretical summary 
>1. The SR supply curve of an industry is just the horizontal sum of the supply curves of the individual firms in that industry. 
>2.  The LR supply curve of an industry has to take into account the exit and entry of firms into the industry. 
>3. If there is free entry and exit, then the long-run equilibrium will involve the max number of firms consistent with nonnegative prices. This means that in the long run the LR supply curve will be essentially horizontal at the price equal to the AVC. 
>4. If there are forces preventing the entry of firms into a profitable industry, the factors that prevent entry will earn economic rent (r). The rent earned can be determined by the price of the $y$ of the industry. 

---
#### Chapter 24: Monopoly 
Industry structure with only one firm, as a result the firm stops being a price taker, as in the competitive case, and starts setting the p. 


**Monopolist profit maximization problem:**


$$
r(y)-c(y)\rightarrow max(y) : r(y) = p(y)y \quad \text{Revenue function}
$$
The optimal condition: 
$$
\frac{\Delta r}{\Delta y} = MR = MC = \frac{\Delta c}{\Delta y}
$$


>[!info] 
A monopolist will never choose to operate where the demand curve is inelastic. As a reminder, we say that: 
> - Demand is elastic when $\epsilon>1$. 
> - Demand is inelastic when $\epsilon<1$
> - Unit elastic demand when $\epsilon=-1$
> Where $\epsilon$ is defined as the percent change of change in quantity divided by the percent change in price, or:  $\epsilon = \frac{p}{y} \frac{\Delta y}{\Delta p}$.

In contrast to the competitive market, the monopoly will operate while $p > MC$. 

**Deadweight loss of a monopoly:**
![[Pasted image 20251215140900.png]]

> Area A is not considered to be a deadweight loss, as there is a surplus transfer between the consumer and the monopolist. In the case of A+B though, it is clear that it is a societal loss. 


**Natural monopoly:**
![[Pasted image 20251215141300.png]]

**MES (Minimum efficient scale):**
The level of output that minimizes average cost, relative to the size of demand. 


**Cartels:**
We say that an industry is organized as a cartel when firms collude to reduce output and increase price. 


>[!summary] Theory summary:
>1.  When there is only a single firm in an industry, we say that it is a monopoly. 
>2. A monopolist operates when $MC = MR$. Hence a monopolist charges a $p$ at a markup of its marginal cost (thus $p > MC$), where the size of the demand depends on the elasticity of demand. 
>3. As the monopolist charges $p > MC$ it will produce an inefficient $y$. The size of this inefficiency is measured by DWL. 
>4. A natural monopoly occurs when a firm cannot replicate at an efficient level of output without losing money. (Public utilities are such examples). Thus they are regulated by the government. 
>5. Weather an industry is competitive or monopolistic is largely depended on its technology, as if a minimum efficient scale is large relative to demand, the market is likely to be monopolized, and vicevesa. 


>[!summary] Practical appendix: 
>The monopolist's profit maximization problem: 
>$$
> r(y)- c(y) \to max : r(y)= p(y) \cdot y
>$$
>FOC: $r'(y)-c'(y)=0 \Leftrightarrow MR - MC=0$
>which implies that MR = MC at $y^*$.
>Differentiating this definition of the R function gives $r'(y)=p(y)+p'(y)y$, which if subsituted into the FOC, gives us: 
>$$ p(y)+p'(y)y = c'(c)$$
>SOC for the monopolists' profit maximizing problem is: 
>$$ r''(y)-c''(y) \leq 0 \to r''(y) \leq c''(y). $$
>or that the slope of the MC curve exceeds the slope of the MR curve.  
>



----

#### Chapter 25: Monopoly Behavior 

It has been described the ways in which monopolies operate at inefficient levels of output, since it restricts the output to a point where people are willing to pay more for extra output that it costs to provide it. The monopolist does not want to produce extra output, because it would force down the price that it would be able to get for all of the outer output that also belongs to it. 

**Price discrimination:**
Selling different units of output at different prices is called price discrimination. (PD)

**First degree PD**
Monopolist sells different units out output for different prices and these prices may differ from person to person. Also called perfect price discrimination. 

Here, each unit of a good is sold to the person who values it the most at the maximum price that such individual values the good. 

![[Pasted image 20251216123955.png]]
> As a result, when the colored section would usually be reserved for the consumer surplus, in the case of a perfect price discrimination, the monopolist would claim all of it as producer surplus. 

> Since in this type of market (with perfect price discrimination, or first degree PD), the monopolist obtains all of the surplus on the market, it could *technically* be called a Pareto-efficient solution (point where the the improvement of one of the players cannot be achieved without leaving someone else worse off). The reason is that, being the beneficiary of the entire surplus, the monopolist, wanting to maximize profit, would attempt to max producer surplus ($PS=\{\pi / F \}$ ), and generating consumer surplus would mean a degree in the already maximized PS of the monopolist. 


![[Pasted image 20251216124701.png]]
A perfectly price discriminating monopolist (First degree PD) must produce at $MC=p$ as when there is $MC <p$ there would be someone else who would exist that would be willing to buy the product at a higher price, and thus, by the constrains of the current model, the monopolist must sell to them instead, evening out $MC=p$.

An alternative way of looking at first degree price discrimination (perfectly price discriminating monopoly) is the monopolist having a fixed amount of good at a "take it or leave it" price. 
![[Pasted image 20251216124954.png]]
> The monopolist would offer to sell $x_{1}^0$ units of the good to person 1 at a price equal to the area under person 1’s demand curve and offer to sell $x^02$ units of the good to person 2 at a price equal to the area under person 2’s demand curve B. As before, each person would end up with zero consumer’s surplus, and the entire surplus of A+B would end up in the hands of the monopolist.

**Second degree PD**
The monopolist sells at different prices for different amounts of output purchased. Also known as non-linear pricing, since it means that the price per unit out output is not constant but depends on how much you pay. 

> Often the monopolist cannot say who it the high and low paying consumer, as the first can often pretend to be the latter. Thus they need an incentive to self select.

We will take the same demand curve in the previous graph and lay them onto each other.  Marginal cost has been equaled to zero to keep everything simple. 
![[Pasted image 20251216130953.png]]
Here the monopolist would like to offer $x_{1}^0$ at price A, and then $x_{2}^0$ at price B + C, but in such a case, those consumers that could pay for B + C would also buy into the $x_{1}^0$ quantity as it is cheaper at A, gaining a consumer surplus, which is bad for the monopolist. 

The monopolist could offer a price A + C for $x_{2}^0$, which would generate more purchases by the high end clients, but it could still be improved upon. 

In Figure C, the monopolist could offer a new price A for the low end costumer that is lower than the original, but also requires a lesser $x_{1}^m$. This option can be tuned to be unattractive to the high end consumer, as they would be getting to little product, and would prefer to by more product at $x_{2}^0$ , thus having to pay A + C + D, leaving the low end consumer with zero surplus as every time and the high end consumer with B surplus, which would be the same were he to consume $x_{1}^m$. 

> In practice the monopolist can adjust this not only the quantity of the good, but by its quality as well. 

**Third degree PD**
The monopolist sells to different people at different prices, but the price is not impacted by the amount of purchases. 

Suppose that we have two groups of people, and can sell one item to each at a different price. We assume that the good cannot be resold. 

$$
p_{1}(y_{1})y_{1}+p_{2}(y_{2}))y_{2} - c(y_{1}+y_{2}) \to max(y_{1},y_{2}) 
$$
with the caveat that $p_{i}(y_{i})$ is the inverse demand functions. 

As per the monopoly optimal solution: 
$$
MR_{i}(y_{i})=MC(y_{1}+y_{2})
$$
> A good should bring the same increase in revenue whether it is sold in market 1 or 2. 

In this model, the market with the higher price must have the lower elasticity of demand. 
$$
|\epsilon_{2}(y_{2})|> |\epsilon_{1}(y_{1})|
$$
>[!summary] Practical appendix: 
>To solve a price discrimination problem, we need to first calculate the inverse demand functions $p_{1}(y_{1}) ,p_{2}(y_{2})$, and obtain the two equations given to us by $MR_{i}=MC$. Solving this would give us $y_{i}^*$ that can be used to obtain $p_{i}^*$. 
>If the monopolist must charge the same price in each market, we first calculate total demand $y_{D}(p)$ and its inverse demand curve, following which we use the $MR=MC$ condition to find the optimal $y^*$ and only then, $p^*$. (**For a clear example with values, check Varian, p 472**).


**Bundling:**
Packages of related goods offered for sale together. 


**Two part tariffs.**
A two part pricing scheme. (Imagine a polaroid camera for one price and the firm (for it) for another). 


**Monopolistic competition.**
![[Pasted image 20251216154555.png]]
**Industry:**
Henceforth we will call an industry as a set of firms that produce products that are viewed as close substitutes by consumers,

- If a large number of firms in an industry produce identical products, then the demand curve facing any of them will be essentially flat as all firms would need to keep their p on the exact price the others were charging, any deviation would loose them their costumers. 

**Product differentiation:**
Each firm attempts to differentiate their product from other firms in an industry. (The soft drink industry is a good example). 

**Monopolistic competition:**
The industry structure is monopolistic in that each firm faces a downward-sloping demand curve for its product. It therefore has some market power in the sense that it can set its own price, rather than passively accept the market price as does a competitive firm. On the other hand the firms must compete for customers in terms of both price and the kinds of products they sell. Furthermore, there are no restrictions against new firms entering into a monopolistically competitive industry. 

Equilibrium in an monopolistic industry:
1. Each firm is selling at a price and output combination on its demand curve
2. Each firm is $\pi \to max$ given the demand curve facing it 
3. Entry has forced the profits of each firm down to zero 

>[!tip]
>![[Pasted image 20251216160716.png]]


(1) tells us that each firm is selling on a point on their demand curve. 

(3) says that entry has forced the profits of each firm down to zero: 
$$
\pi =0 \implies \pi = TR - TC \implies 0 = (y \cdot p) - (AC \cdot y)\implies 0 = (p  - AC) \cdot y
$$
Now consider that the only way for this to be true, considering that the monopoly is producing *something* is to say that $p = AC$. As a result the point at which the firm is selling must also touch the AC curve. 

As a result the operating position of the firm must be a point that lies on both curves. 

Now, the demand curve could not cross the AC curve, as (2) has required $\pi \rightarrow max$, if it did cross it, we would see $p >AC$, and thus non-negative profit, which would contradict the (3) point. 

**A location model of product differentiation:**

Suppose that two ice cream vendors are allowed. Suppose that we fix the price that they are able to charge for their ice cream and just ask where they should locate in order to minimize the total distance walked. If each consumer walks to the ice cream vendor nearest him, we should put one vendor a quarter of the way along the boardwalk and one vendor three- quarters of the way along the boardwalk. The consumer halfway along the boardwalk will be indifferent between the two ice cream vendors; each has a market share of one-half of the consumers. (See Figure) But do the ice cream vendors have an incentive to stay in these locations? Put yourself in the position of vendor L. If you move a little bit to the right, you will steal some of the other vendor’s customers and you won’t lose any of your own. By moving to the right, you will still be the closest vendor to all the customers to your left and you will still be closer to the customers on your right. You will therefore increase your market share and your profits. Vendor B reasons the same way.

![[Pasted image 20251216162337.png]]

**Another example of location model for PD**

> The boardwalk model suggest that monopolistic competition will result in too little product differentiation: each firm will want to make its product similar to that of the other firm in order to steal the other firm’s customers. Indeed, we can think of markets in which there is too much imitation relative to what seems to be optimal. However, it doesn’t always work this way. Suppose that the boardwalk is very long. Then each ice cream vendor would be perfectly happy sitting near each end of the boardwalk. If their market areas don’t overlap, nothing is to be gained from moving closer to the middle of the boardwalk. In this case, neither monopolist has an incentive to imitate the other, and the products are about as different as they can get. It is possible to produce models of monopolistic competition where there is excessive product differentiation. In such models, each firm attempts to make consumers think that its product is different from the products of its competitors so as to create some degree of market power. If the firms succeed in convincing the consumers that their product has no close substitutes, they will be able to charge a higher price for it than they would otherwise be able to do. This leads each producer to invest heavily in creating a distinctive brand identity. Laundry soap, for example, is a pretty standardized commodity. Yet manufacturers invest huge amounts of money in advertisements that claim cleaner clothes, better smell, a better marriage, and and a generally happier life if you choose their brand rather than a competitor’s. This “product positioning” is much like the ice cream vendors locating far away from each other in order to avoid head-to-head competition. There are critics who have argued that such excessive investment in product positioning is wasteful. Perhaps this is true in some cases, but then again, “excessive variety” may simply be a consequence of encouraging firms to provide consumers with a variety of products from which to choose.

[[microeconomics hal r. varian.pdf#page=508&selection=33,0,73,77|microeconomics hal r. varian, page 508]]

**More Vendors**
We have shown that if there are two vendors whose market areas overlap, and each seller sells the same price, they will both end up located at the “middle” of the boardwalk. What happens if there are more than two vendors who compete in their location? 

The next easiest case is that of three vendors. This case gives rise to a rather peculiar outcome: there may be no equilibrium location pattern!

![[Pasted image 20251216162645.png]]
If there i more than three firms then an equilibrium pattern will generally emerge. 

>[!summary] Theory summary: 
>1. There usually is an incentive for a monopolist to engage in some sort of price discrimination. (There are first degree PD (also known as perfect price discrimination, or has the perfectly price discriminating monopolist), second degree PD (non linear pricing), and third degree PD).
>2. Perfect price discrimination involves charging each consumer a different take it or leave it price. This will result in an Pareto efficient level of output. 
>3. If a firm can charge different prices in two different markets, it will tend to charge the lower price in the market with the more elastic demand. 
>4. If a firm can set a two-part tariff, and consumers are identical, then it will generally want to set $p = MC$ and make all of its profits from the entry fee. 
>5. Monopolistic competition refers to a situation in which  there is product differentiation so each firm has some degree of monopoly power, but there is also free entry so that profits are driven to zero. 
>6. Monopolistic competition can result in too much or too little product differentiation in general. 


---
#### Chapter 26: Factor Markets

**Monopoly in the output market**

Suppose that the firm is the sole monopolist on the market, with a single product and a production function of $y=f(x)$. The revenue of that firm is $r(y)=p(y) \cdot y$, where $p(y)$ is the inverse demand function. 

Suppose we increase the amount of input x by $\Delta x$. The ratio of increase in output to the increase in the input is

$$MP_{x}=\frac{y}{x}$$

The increase in output will cause revenue to change. The change of revenue: 

$$
MR_{y}=\frac{\Delta R}{\Delta y}
$$

The effect on revenue due to the marginal increase in input is called the Marginal Revenue Product (MRS):
$$
MRP_{x} = \frac{\Delta R}{\Delta x}=\frac{\Delta R}{\Delta x} \cdot \frac{\Delta y}{\Delta x} = MR_{y} \cdot MP_{x}
$$

Marginal revenue product can be rewritten as: 
$$
MRP_{x} = \left[ p(y)+\frac{\Delta p}{\Delta y} y \right] MP_{x} = p(y) \left[ 1+\frac{1}{\epsilon} \right] MP_{x}
$$

> Most often than not the first definition is used rather than the elasticity one. 

Then in order to determine how much of a factor a firm employs, we have to compare the MR of an additional unit of the factor to the MC of hiring the factor. 

In the case of a competitive factor market it will want to hire x
$$
p MC(x_{c}) = w
$$
In the case of a monopolist it will want to hire x
$$
MRP(x_{m})=w
$$

![[Pasted image 20251216175903.png]]

> Thus the monopolist hires less than the competitive firm. 


**Monopsony**
In a monopsony there is a single buyer. 

We will suppose that the buyer produces output that will be sold in a competitive market.

A production function $y=f(x)$ will be introduced. Unlike a monopoly though, we will have the firm suppose that the firm dominates the factor market, and that it recognizes the amount of factor x that it demands will influence the price that it has to pay for this factor. 

This relationship will be shown by the inverse supply curve $w(x)$. 

**Inverse supply curve** (look at it as wage for a factor of production x (usually it would be labor or capital)
The inverse supply curve $w(x)$ is that if the firm wants to hire x of a factor then it must pay $w(x)$. We assume that $w(x)$ is an increasing function: the more the firm wants to employ x, the higher the factor of the price for it must be. 

In a competitive factor market there will be a flat factor supply curve, as the firm can hire as much as it wants at the going factor price. 

In a monopsonist factor market there will be a upward sloping factor supply curve: the more the firm wants to hire the higher a factor price it must offer. 

>[!important]
>As a result, a firm in a competitive factor market is a price taker, and a monosponist is a price **maker**. 

>[!summary] Monosponist profit maximization problem 
>$$
> p y - w(x)x \rightarrow  max(x)
>$$
>The condition for $\pi \rightarrow max$  is that $MR_{x}=MC_{x}$. Since our assumption has a competitive output market, the $MR_{x}=pMP_{x}$ and the $MC_{x} = w\left[ 1 + \frac{1}{\epsilon} \right]$ where $\epsilon$ is the supply elasticity of the factor. Considering that supply curves slope upwards (usually), $\epsilon$ is likely to be a positive number. If the supply curve is perfectly elastic, $\epsilon =\infty$ this reduces the case to a firm facing a competitive factor market. 
>
>Suppose an inverse supply curve: $w(x)=a +bx$, so the $c(x)=w(x)x=ax+bx^2$, and thus the $MC_{x}(x)= a + 2bx$ 
>![[Pasted image 20251216185246.png]]
>

As the $MC_{x}>w(x)$ the factor price will be lower than if the firm had faced a competitive market. Too little of the factor will be hired relative to the competitive market. As a result, the monosponist also operates at a Pareto inefficient point. 

>[!summary] Theory summary 
>1. A $\pi \rightarrow max$ firm will always want to set the $MC$ of each action to the $MR$ of said action. 
>2. In the case of a monopolist, the MR associated with an increase of employment of a factor is called the MRP. 
>3. In the case of a monopolist, the MRP will always be smaller than the value of the marginal product due to the fact that the marginal revenue from increasing output is always less than price. 
>4. Just as a monopoly consists of a single seller, the monopsony consists of a single buyer. 
>5. For a monopsonist the MC curve associated with a factor will be steeper than the supply curve of that factor. 
>6. Hence a monopsonists will hire an ineffectively small amount of the factor of production. 


>[!warning] 
> Monospony ends here. The remainder of the chapter will be further revisited in in part III. 














---

Literature:
Varian. 
- Chapter 22
- Chapter 23 
- Chapter 24
- Chapter 25 
- Chapter 26 (first half)
