---
output:
  html_document: default
  pdf_document: default
---

## Baron and Kenny (1986)
## The Foundational Regression-Based Approach

## Why Mediation?

-   Establishing that $X$ affects $Y$ is only the **beginning** of a causal inquiry
-   The deeper question: **how** or **why** does the effect occur?
-   A **mediator** $M$ represents the mechanism through which $X$ influences $Y$

**Key distinction Baron & Kenny insisted on:**

-   **Moderator:** changes the *strength or direction* of $X \to Y$ — appears as an interaction term
-   **Mediator:** explains the *mechanism* of $X \to Y$ — lies on the causal pathway

These were routinely conflated in psychology before 1986.

------------------------------------------------------------------------

## The Mediation Path Diagram

$$X \xrightarrow{a} M \xrightarrow{b} Y$$ $$X \xrightarrow{c} Y \quad \xrightarrow{\text{becomes}} \quad X \xrightarrow{c'} Y \text{ (controlling for } M\text{)}$$

-   Path $a$: effect of $X$ on the mediator $M$
-   Path $b$: effect of $M$ on $Y$, controlling for $X$
-   Path $c$: total effect of $X$ on $Y$
-   Path $c'$: **direct** effect of $X$ on $Y$ after controlling for $M$

**Perfect mediation:** $c' = 0$ — $X$ has no effect on $Y$ once $M$ is controlled

------------------------------------------------------------------------

## The Four-Step Procedure

To establish mediation, estimate three regression equations and verify:

1.  **Step 1:** Regress $M$ on $X$ — confirm $X$ significantly predicts $M$ (path $a$)

2.  **Step 2:** Regress $Y$ on $X$ alone — confirm $X$ significantly predicts $Y$ (path $c$)

3.  **Step 3:** Regress $Y$ on both $X$ and $M$ — confirm:

    -   $M$ significantly predicts $Y$ (path $b$)
    -   Coefficient on $X$ is **smaller** than in Step 2

**When all conditions hold**, $M$ is a mediator. The stronger the reduction in $c \to c'$, the stronger the mediation.

------------------------------------------------------------------------

## The Sobel Test

Sobel (1982) provides a significance test for the **indirect effect** $ab$:

$$\widehat{\text{se}}(ab) \approx \sqrt{b^2 s_a^2 + a^2 s_b^2}$$

where $s_a$, $s_b$ are standard errors of paths $a$ and $b$ respectively.

-   Allows a $z$-test of $H_0: ab = 0$
-   Became the standard compact test for mediation in applied psychology
-   Used widely for two decades after the paper

------------------------------------------------------------------------

## What the Paper Gets Right

-   Provided a **clear, testable, operational definition** of mediation
-   Connected directly to regression tools researchers already knew
-   Established the vocabulary — *moderator vs. mediator* — that the whole field now uses
-   The four-step procedure is intuitive and easy to implement

The 1986 paper is one of the **most cited papers in all of social science** for good reason: it gave empirical researchers a concrete procedure where none existed before.

------------------------------------------------------------------------

## What the Paper Silently Assumes

**1. Linearity and no interaction:** OLS regression implicitly assumes $X$ and $M$ do not interact in producing $Y$ — the direct and indirect effects are assumed to **add up** to the total effect.

**2. No unmeasured** $M \to Y$ confounding: The coefficient on $M$ in Step 3 is treated as causal — requires no common causes of $M$ and $Y$ outside the model. **Never stated.**

**3. No formal causal framework:** No DAGs, no counterfactuals, no do-calculus. Coefficients are given causal meaning purely by convention.

**4. No discussion of identifiability:** Whether direct and indirect effects can even be recovered from data — even in a randomized trial — is never raised.

------------------------------------------------------------------------
