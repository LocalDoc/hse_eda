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

>[!note]
The $MC$ curve intersects the $AC$ and $AVC$ curves at their minimums (at interior points).

**Definition.** Fixed costs $F$ can be further decomposed into **sunk costs** and **avoidable fixed costs.**

**Definition.** The total cost of producing quantity $q$ is given by:
$$C(q) = \begin{cases} S & q = 0 \\ F + VC(q) & q > 0 \end{cases}$$
where:
- $S$ is the sunk cost part of fixed costs ($S \leq F$)
- $F - S$ is the avoidable part of fixed costs

>[!note]
Teachers sometimes assume that $S = F$.

>[!note]
There will be an upcoming task where if you are unable to find the the fixed costs, it is recommended you draw the cost function $c(q)$. 

#### Perfect Competition

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

The shutdown price $p_{s}$ can be as low as $AVC^*$ or as high as $AC^*.$ Furthermore, if some of the shutdown costs are avoidable, then shutdown costs become higher. 

**Class Example 1**. Suppose the firm's total cost of producing $q$ is given by:
$$C(q) = \begin{cases} 12 & q = 0 \\ 16 + q^2 & q > 0 \end{cases}$$
Construct the firm's supply function $s(p)$.

Step 1: (finding $q^*$) 
$$p=MC(q^*) = C(q)' \text{ (FOC)} \implies p = 2q \implies q^* = \frac{p}{2}$$

Step 2:
$$
\pi(q^*) = p \cdot q^* - C(q^*) = 2q{^*}^2  -16 - (q^*)^2 = (q^*)^2 - 16
$$

$$
\pi(q^*)\geq \pi (0) 
$$

$$
q^* - 16 \geq -12 \implies (q^*)^2 \geq  4\implies q^* = 2 
$$

As a result, we have:

$$
S(p)  = 
\begin{cases}
 0 & p < 4 ; \\
0 \text{ or } 2 & p = 0; \\
 \frac{p}{2} & p > 4
\end{cases}
$$ 

####  Topic: Short-run, long-run competitive equilibrium, and social welfare. 
---
### Short-run Competitive Equilibrium

The market demand is given by the function `$D(p)$`, which specifies the total quantity demanded at a given per-unit price `$p$`.

>[!note] 
>We are given n firms with cost functions: `$C_{1}(q),\dots,C_{n}(q)$`. At the equilibrium point we assume, by definition, that the `$C_{i}(q)=s_{i}(q)$`.

On the supply side, with `$n$` firms, each with an individual supply curve `$s_i(p)$`, the market supply is the sum of all individual supplies:
$$S(p) = \sum_{i=1}^N s_i(p)$$

>[!tip]
>When drawing the aggregate price against quantity supplied / demanded, it is recommended to use the x axis for the variable. 

The market clearing price `$p^*$` is the price that equalizes supply and demand.  This concept is known as short run equilibrium:
$$S(p^*) = D(p^*)$$

>[!note]
>A price `$p^*$` satisfying this condition might not always exist.
>In this short-run equilibrium, some firms may have `$s_i(p^*) = 0$` and can have positive (`$\pi > 0$`) or negative (`$\pi < 0$`) profit.

**Class example 2:**
Market demand is given by: `$D(p) = 20 -p$`  
Suppose that all `$n > 1$` firms are identical (In the sense of all having the same cost function)  
Suppose that a firm's cost function is: 

$$
C(q) = 
\begin{cases}
12 & q  =0 \\
16 + q^2 & q > 0
\end{cases}
$$

>[!note]
>We've seen this in Class Example 1 so we know that:  
>$$ S(q) = \begin{cases}
 0 & p < 4  \\
 0 \text{ or } 2 & p = 4 \\
\frac{p}{2} & p > 4
\end{cases} $$

Find the short run (SR) equilibrium (Eq) (if it exists) for all n. 

Case 1: Eq price is `$p < 4$`.  
We can make the assumption that `$D(p) > 16$`. Furthermore, according to `$S(q)$` we know that `$S(q) = 0$`. There is a demand of 16 units and a supply of 0 units. Thus, there is no equilibrium. 

Case 2: Eq price is `$p>4$`.  
This means that `$s_{i}(p) =\frac{p}{2}$`. We are finding the SR Eq for all n firms, so: `$S(q)=\sum_{i =1}^n= \frac{{n \cdot p}}{2}$`.  

We know that the condition the market clearing price `$p^*$`, which we need for the SR Eq. is `$D(p^*) =S(p^*)$`.  

We solve; `$20 - p^*=\frac{n\cdot p}{2}\implies p^*=\frac{40}{n +2}$`. We know that `$p^* >4\implies n < 8\implies n\le {7}$`

Case 3: Eq price is `$p=4$`.

`$S_{i}(4)=0, S_{i'}(4)=2, D(4)=16$`. Here we could have an equilibrium with 8 firms that produce 2 units each. Or:
$$
\begin{cases}
q_{i}^*=2 & \text{first 8} \\
q_{i}^*=0 & \text{next n - 8}
\end{cases}  \ \ \ \forall n \ge 8
$$

---

### Long-run Competitive Equilibrium

Assumption. All firms (of which we have an infinite supply of) are identical (they share the same cost structure), there are no sunk costs (`$c(0) = 0$`), and entry into or exit from the market is free.

The number of firms `$n$` is not fixed but adjusts in the long run through the process of entry and exit.

A long-run equilibrium consists of a market price `$p^*$` and a number of firms `$n$` such that:  
1. Market supply equals market demand:
   $$n \cdot S(p^*) = D(p^*)$$
2. Free entry and exit ensures that each firm makes zero economic profit:
   $$\pi(s(p^*)) = 0$$
   This "zero-profit" condition is equivalent to `$p^* = AC(q^*)$`, where `$q^*$` is the quantity supplied by each firm at price `$p^*$`.

---

### Social Welfare: Demand and Inverse Demand

>[!note]
>Some might remember that demand functions can  take more parameters than just price, such as income (or others i forgor), the reason we can currently disregard the other factors for our work is that those utility functions from micro 1 can be transformed to the standard maximization functions.  
>
>An example would be that `$V(q,m)=V(q) + m \implies {}\underset{q \geq 0}{max} V(q) - p\cdot q$`.

For a consumer with quasilinear utility `$v(q) + m$` (where `$v'(q) > 0$`, `$v''(q) < 0$`, and `$v(0) = 0$`), the solution to `$\max_{q \geq 0} v(q) - p \cdot q$` yields the inverse demand function:
$$p(q) = mv(q) = D^{-1}(q)$$
This function represents the highest per-unit price a consumer is willing to pay for quantity `$q$`. An inverse demand function of q = 10 would be the highest price a customer would be willing to pay for 10 units of product. 

The demand function `$D(p)$` is the quantity a consumer wants to buy at a per-unit price `$p$` (`$q = D(p)$`).

>[!note]
>The total value, `$v(q)$`, a consumer gets from `$q$` units is the area under their inverse demand curve from `$0$` to `$q$`:
>$$\int_0^q p(x)dx = \int_0^q mv(x)dx = v(q)$$

---

### Social Welfare: Consumer, Producer, and Social Surplus

If `$q$` units are bought at a single per-unit price `$p(q)$`, the Consumer Surplus (CS) is the total value consumers receive minus the total amount they pay:
$$CS := \int_0^q p(x) dx - p(q) \cdot q$$

If `$q$` units are sold at a single per-unit price `$p(q)$`, the Producer Surplus (PS) is the total payment producers receive minus the total variable cost of production:
$$PS(q) := p(q) \cdot q - \int_0^q MC(x) dx$$

>[!note]
> The sole difference between profit (`$\pi$`) and PS is that profit accounts for fixed costs, and producer surplus does not. 

The sum of consumer and producer surplus is called Social Welfare (SW):
$$SW := CS + PS$$

This can be rewritten as: 
$$ SW := \int^q_{0} p(x) dx - \int^q_{0} MC(x) dx$$


![[maximing social welfare.png|center]]

Too Little Output (`$q' < q^*$`): A deadweight loss (DWL > 0) exists because the value of additional units (given by the demand curve) exceeds the cost of producing them (given by the supply curve). Social welfare (`$SW = CS + PS$`) is not maximized.

![[maximing social welfare 2.png|center]]

Too Much Output (`$q' > q^*$`): A deadweight loss (DWL > 0) exists because the cost of producing the additional units exceeds their value to consumers. Social welfare (`$SW = CS + PS$`) is not maximized. The section where the producer takes on looses but the consumer wins out count as a net zero for the social welfare. 

![[maximing social welfare 3.png|center]]

Efficient Output (`$q^*$`): Social welfare (`$SW = CS + PS$`) is maximized. The market allocates resources efficiently, and the deadweight loss is `$DWL = 0$`.

**Class Example 3**

 Market Demand: `$D(p) = 30 - p$`  
Firm's Cost Function: `$C(q) = q^2$` for `$q \geq 0$`

---

There are two ways to solve this task: 

1. Finding the Competitive Equilibrium (`$p^*, q^*$`)

Set Supply equal to Demand: (equilibrium condition)
$$S(p^*) = D(p^*)$$
$$\frac{p^*}{2} = 30 - p^*$$

Solve for `$p^*$`:
$$\frac{p^*}{2} + p^* = 30$$
$$\frac{3p^*}{2} = 30$$
$$p^* = 20$$

Find `$q^*$` by plugging `$p^*$` into supply or demand:
$$q^* = S(p^*) = \frac{20}{2} = 10$$
$$q^* = D(p^*) = 30 - 20 = 10$$

Equilibrium: `$(p^*, q^*) = (20, 10)$`

---

2. Calculating Surpluses and Welfare

Marginal Cost and Inverse Functions
- Marginal Cost: `$MC(q) = C'(q) = 2q$`
- Inverse Demand Function: `$p(q) = 30 - q$`
- Inverse Supply Function: The supply curve is the MC curve above the shutdown point. Since `$C(q)=q^2$` has `$FC=0$`, the firm will supply at any `$p>0$`. Thus, the inverse supply is `$P = MC(q) = 2q$`.

From this we can also obtain the equilibrium:

Remember that:
$$
P(q) = MC(q)
$$
Which is:
$$
2q=30-q
$$

Thus, equilibrium: `$(p^*, q^*) = (20, 10)$`

Now to find the CS and the PS, but this method is kind of cumbersome. 

>[!tip]
>It is recommended to try graphing the supply and demand curves, which tends to make it easier to find the CS and PS wihtout all of these calculations. 

Consumer Surplus (CS)  
CS is the area below the demand curve and above the price line.
$$CS = \int_{0}^{q^*} (P(q) - p^*)  dq = \int_{0}^{10} ((30 - q) - 20)  dq$$
$$CS = \int_{0}^{10} (10 - q)  dq = \left[ 10q - \frac{1}{2}q^2 \right]_{0}^{10}$$
$$CS = (100 - 50) - (0) = 50$$

Producer Surplus (PS)  
PS is the area below the price line and above the supply (MC) curve.
$$PS = \int_{0}^{q^*} (p^* - MC(q))  dq = \int_{0}^{10} (20 - 2q)  dq$$
$$PS = \left[ 20q - q^2 \right]_{0}^{10}$$
$$PS = (200 - 100) - (0) = 100$$

Social Welfare (SW) / Total Surplus
$$SW = CS + PS = 50 + 100 = 150$$

Deadweight Loss (DWL)  
In the perfect competition model, the equilibrium is Pareto efficient. Therefore, there is no deadweight loss.
$$DWL = 0$$


