---
editor_options: 
  markdown: 
    wrap: 72
---

## Where This Paper Sits

The identification of NDE and NIE requires cross-world independence:

$$Y(a, m) \perp\!\!\!\perp M(a^*) \quad \forall\, m, \quad a \neq a^*$$

-   **VanderWeele & Vansteelandt (2009):** listed this as Assumption A4
    and noted it is problematic
-   **Common wisdom in applied work:** A4 fails if and only if there is
    an exposure-induced mediator-outcome confounder $L$

**Andrews & Didelez (2020) show both of these are incomplete:** 1. The
same DAG can lead to opposite identification conclusions depending on
which model class you assume 2. Cross-world independence can fail even
with **no intermediate confounding at all**

------------------------------------------------------------------------

## Two Model Classes, Same DAG

Given the simple DAG $A \to M \to Y$, $A \to Y$ with no confounders:

**FFRCISTG** (Robins' single-world model):
$$M(a) \perp\!\!\!\perp A, \quad Y(a,m) \perp\!\!\!\perp A, \quad Y(a,m) \perp\!\!\!\perp M(a) \mid A=a$$

-   All three use the **same** $a$ — checkable on a SWIG
-   Under FFRCISTG alone: NDE and NIE are **not identified**

**NPSEM-IE** (Pearl's model with independent errors): - Implies the
three conditions above **plus** cross-world independence
$Y(a,m) \perp\!\!\!\perp M(a^*)$ for $a \neq a^*$ - Under NPSEM-IE: NDE
and NIE **are identified** by the mediation formula

**Implication:** Assuming NDE/NIE are identified commits you to NPSEM-IE
— an assumption invisible in the DAG itself.

------------------------------------------------------------------------

## Cross-World Violations Beyond Intermediate Confounding

Standard check: look for an exposure-induced confounder $L$
($A \to L \to M$, $A \to L \to Y$).

**But Andrews & Didelez construct a counterexample where:** - No
intermediate confounding ($L$ absent) - All single-world assumptions
hold: $Y(a,m) \perp\!\!\!\perp M(a) \mid A=a$ - Yet cross-world
independence **still fails**

The culprit is an unobserved $U$ that connects $M(a^*=0)$ and
$Y(a=1, m)$ **across worlds**:

$$M(a^*=0) \leftarrow U \rightarrow Y(a=1, m)$$

They call $U$ a **cross-world confounder** — distinct from ordinary
confounders because it only acts across different interventional
settings.

------------------------------------------------------------------------

## The Knee Surgery Example

**Setting:** Effect of knee replacement surgery ($A$) on quality of life
($Y$) through walking speed ($M$)

An unobserved genetic marker $U$: - Slows walking speed **without
surgery** — affects $M(0)$ - Causes surgical scarring **with surgery** —
affects $Y(1, m)$ via scarring $S$ - Scarring does **not** affect
walking speed — so no $S \to M$ edge, no intermediate confounding

**Result:** $$Y(1, m) = Y(1, S(1), m) \not\!\!\perp\!\!\!\perp M(0)$$

because both depend on the common $U$.

**Key lesson:** Absence of intermediate confounding is **not
sufficient** to justify cross-world independence. A subject-matter audit
of cross-world pathways is required.

------------------------------------------------------------------------

## When NDE and NIE Are Identified

When assumptions (FFRCISTG + cross-world independence) all hold, the
**mediation g-formula** identifies NDE and NIE:

$$\widehat{\text{NDE}} = \sum_m \big(E\{Y \mid A=a, M=m\} - E\{Y \mid A=a^*, M=m\}\big)\, p(M=m \mid A=a^*)$$

$$\widehat{\text{NIE}} = \sum_m E\{Y \mid A=a, M=m\}\, \big(p(M=m \mid A=a) - p(M=m \mid A=a^*)\big)$$

When cross-world independence **fails**, these formulas are still
computable — but they are **biased** for the true NDE and NIE.

------------------------------------------------------------------------

## Alternatives to Cross-World Independence

**1. Bounds** — under FFRCISTG assumptions alone, NDE is not
point-identified but can be bounded. For binary $A, M, Y$:

$$\text{NDE} \in \Big[\text{max}(\ldots),\; \text{min}(\ldots)\Big]$$

Often wide — quantify what data alone can tell us without cross-world
assumptions.

**2. Parametric assumptions** — e.g. no additive interaction:
$$Y(a,m) - Y(a^*,m) = B(a,a^*) \text{ does not depend on } m$$ Then NDE
$= E\{B(a,a^*)\}$ is identified from single-world quantities alone.

**3. Alternative estimands** — redefine the target: - **Interventional
effects:** set $M$ to a random draw from $p(M(a^*))$ rather than the
individual-specific $M(a^*)$ - **Separable effects** (Robins &
Richardson): decompose $A$ into components $A^M$ and $A^Y$ — entirely
single-world, motivates the interventionist approach of Robins et al.
(2022)

------------------------------------------------------------------------

## Numerical Illustration of Bias

Andrews & Didelez simulate the knee surgery DGP where cross-world
independence is violated **but no intermediate confounding exists** —
isolating the effect of cross-world confounding alone.

They compute Pearl's g-formula and compare to the true NDE over 327,680
parameter settings:

| Outcome | Bias range | Max relative bias |
|------------------|--------------------|----------------------------------|
| Continuous $Y$ | $-3.3$ to $+3.3$ SD | Driven by 3-way interaction $\beta_5$ |
| Binary $Y$ ($\beta_5 \neq 0$) | $-0.04$ to $+0.04$ | Up to **70%** |

-   Bias is **zero** when the 3-way $A \times M \times U$ interaction
    $\beta_5 = 0$ (linear case)
-   Bounds were informative but wide — could not replace the cross-world
    assumption

**Takeaway:** Cross-world confounding is not just a theoretical concern
— it can produce substantial bias in realistic settings.

------------------------------------------------------------------------

## Positioning in the Chronological Story

| Paper | What they do |
|--------------------------|----------------------------------------------|
| Baron & Kenny (1986) | Regression procedure — no causal framework, assumptions implicit |
| Robins & Greenland (1992) | Counterfactual framework — nonidentifiability even under randomization |
| Pearl (2001) | NPSEM-IE — cross-world independence as structural consequence |
| VanderWeele & Vansteelandt (2009) | Make A1–A4 explicit, note A4 is problematic |
| **Andrews & Didelez (2020)** | **Show A4 can fail without** $L$; catalogue alternatives |
| Robins, Richardson & Shpitser (2022) | Abandon cross-world entirely — separable/interventionist effects |
