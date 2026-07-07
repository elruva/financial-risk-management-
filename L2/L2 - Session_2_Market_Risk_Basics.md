# Financial Risk Management and Engineering
## Session 2 — Market Risk Basics: Returns, Volatility & Correlation

---

### Slide 2 · Learning Objectives
By the end of this session, you will be able to:
1. Compute **simple and log returns** and explain why logs are preferred (time-additivity, stationarity).
2. Describe the **stylised facts** of returns: fat tails, volatility clustering, near-zero autocorrelation.
3. Implement **EWMA volatility** (Hull Ch. 8) and interpret the RiskMetrics decay factor λ.
4. Fit and interpret a **GARCH(1,1)** model: persistence, long-run variance, half-life.
5. Estimate **beta** with the market model and split risk into systematic vs idiosyncratic (Jorion Ch. 5).
6. Build a **rolling correlation matrix** and explain why correlations rise in crises (Longin & Solnik 2001).

---

## Block 0 · The Distribution Toolkit

### Slide 3 · The Distribution Toolkit
**Four modelling jobs**
- **Returns and P&L** — how big is a typical move and how fat are the tails: Normal, Student-t, Lognormal, Generalized Pareto.
- **Counts of events** — how many defaults, losses or jumps: Bernoulli/Binomial, Poisson.
- **Times between events** — how long until the next default or loss: Exponential.
- **Rates and proportions on [0,1]** — recovery, probability of default: Beta.

**Inference and testing**
- Chi-square and F underpin variance estimation, goodness-of-fit, and model-comparison tests.

---

### Slide 4 · Normal (Gaussian) Distribution
*(Slide shows the symmetric bell-curve PDF.)*

**Main feature**
- Symmetric bell curve fully described by its mean μ and variance σ².
- Thin tails (kurtosis = 3); a sum of independent normals is again normal.
- Justified by the **Central Limit Theorem** for sums of many small shocks.

**Benefits**
- Analytically tractable — closed-form VaR $= \mu + \sigma\,z_\alpha$ and simple portfolio aggregation.
- Only two parameters to estimate; the backbone of the variance-covariance method.

**Uses in risk management**
- Parametric (delta-normal) VaR and RiskMetrics; portfolio return modelling.
- Normal log-returns underlie Black–Scholes; the null hypothesis in normality tests.
- **Caveat**: underestimates extreme losses — real returns are fat-tailed.

---

### Slide 5 · Student-t Distribution
*(Slide shows a t-density with heavier tails than the normal overlaid.)*

**Main feature**
- Symmetric like the normal but with **heavier tails**; the degrees of freedom ν control tail thickness.
- Excess kurtosis when ν > 4; as ν grows it converges to the normal.

**Benefits**
- Captures fat tails and extreme moves the normal misses, with just one extra parameter.
- Standardised t is a drop-in innovation for **GARCH-t** volatility models.

**Uses in risk management**
- Fat-tailed VaR and Expected Shortfall; GARCH(1,1)-t daily return models.
- The **t-copula** for joint tail dependence (joint crashes across assets).
- Small-sample inference and regression t-statistics (e.g. testing whether a beta is significant).

---

### Slide 6 · Lognormal Distribution
*(Slide shows a right-skewed, strictly-positive density.)*

**Main feature**
- A variable whose logarithm is normal; strictly positive and right-skewed.
- Arises from **multiplicative (compounding) growth** rather than additive shocks.

**Benefits**
- Never goes negative — the natural model for prices, values and loss sizes.
- Consistent with **geometric Brownian motion** and normal log-returns.

**Uses in risk management**
- Asset and stock **PRICE** modelling (the Black–Scholes underlying).
- Loss **SEVERITY** in operational-risk loss-distribution models; positive quantities such as rates.

---

### Slide 7 · Chi-Square Distribution
*(Slide shows right-skewed χ² densities for varying degrees of freedom.)*

**Main feature**
- The distribution of a sum of *k* squared standard normals; positive and right-skewed.
- Mean = *k* and variance = 2*k*; approaches the normal as the degrees of freedom *k* grow.

**Benefits**
- Links naturally to variances (sums of squares) and to likelihood-based tests.

**Uses in risk management**
- Variance and covariance inference; goodness-of-fit and normality tests (Jarque–Bera is χ² with 2 df).
- Likelihood-ratio tests for nested models (e.g. ARCH vs GARCH).
- VaR backtesting: the **Kupiec POF** and **Christoffersen independence** tests are chi-square.

---

### Slide 8 · F-Distribution
*(Slide shows right-skewed F densities.)*

**Main feature**
- The ratio of two independent scaled chi-square variables; positive and right-skewed.
- Two degrees-of-freedom parameters (numerator and denominator).

**Benefits**
- Purpose-built to compare two variances or the fit of two nested models.

**Uses in risk management**
- Joint significance tests in factor models and regressions (an F-test on several betas at once).
- Comparing volatility between two periods or assets (variance-ratio tests); ANOVA in factor analysis.

---

### Slide 9 · Generalized Pareto Distribution (EVT)
*(Slide shows a heavy tail beyond a threshold.)*

**Main feature**
- Models only the **TAIL** — the distribution of exceedances over a high threshold (peaks-over-threshold).
- The shape parameter ξ sets tail heaviness; ξ > 0 gives a heavy (power-law) tail.

**Benefits**
- Concentrates the data on the extremes and is theoretically justified for tails (Pickands–Balkema–de Haan).
- Extrapolates beyond the largest observed loss — essential for rare events.

**Uses in risk management**
- Extreme VaR and Expected Shortfall at very high confidence (99.9%); operational-risk capital.
- Tail-index estimation and tail stress testing (Extreme Value Theory).

---

### Slide 10 · Poisson Distribution
*(Slide shows a discrete count PMF.)*

**Main feature**
- Counts of rare, independent events in a fixed interval, governed by a single rate λ.
- Mean = variance = λ; sums of independent Poissons are again Poisson.

**Benefits**
- The simplest event-count model and the building block of compound loss models.

**Uses in risk management**
- Operational-loss **FREQUENCY** in the compound-Poisson loss-distribution approach (frequency × severity).
- Number of defaults in a pool; jump counts in jump-diffusion; arrival of claims or trades.

---

### Slide 11 · Bernoulli and Binomial Distributions
*(Slide shows a binomial PMF.)*

**Main feature**
- **Bernoulli**: a single yes/no outcome (default or no default) with probability *p*.
- **Binomial**: the number of defaults among *n* independent obligors, each with probability *p*.

**Benefits**
- The natural, interpretable model for default events and probabilities of default (PD).

**Uses in risk management**
- Credit default modelling and PD; binomial trees for option pricing.
- Counting VaR exceptions in backtesting (the basis of the Kupiec test).
- **Caveat**: real defaults are correlated — independence understates portfolio tail risk.

---

### Slide 12 · Exponential Distribution
*(Slide shows a decaying density.)*

**Main feature**
- The time until the first event (or between events); a constant hazard rate λ.
- **Memoryless**: elapsed time does not change the remaining waiting time.

**Benefits**
- A simple survival/hazard model; the interarrival time of a Poisson process.

**Uses in risk management**
- Reduced-form (intensity) credit models: time-to-default with hazard λ.
- Interarrival times of losses and jumps; survival and waiting-time analysis.

---

### Slide 13 · Beta Distribution
*(Slide shows densities bounded on [0,1] in various shapes.)*

**Main feature**
- Bounded on [0,1] with two shape parameters *a* and *b*; can be U-shaped, bell-shaped or skewed.

**Benefits**
- The flexible default choice for proportions, rates and probabilities; **conjugate prior** for Bernoulli.

**Uses in risk management**
- Recovery rates and **loss-given-default (LGD)** modelling.
- Bayesian estimation of default probabilities; any quantity constrained to [0,1].

---

### Slide 14 · Choosing the Right Distribution

| Domain | Distributions |
|--------|---------------|
| **Market risk** | Normal for quick parametric VaR; Student-t and Generalized Pareto when tails are fat; Lognormal for prices and severities. |
| **Credit risk** | Bernoulli/Binomial for defaults; Exponential for time-to-default; Beta for recovery / loss-given-default. |
| **Operational risk** | Compound Poisson × Lognormal for frequency × severity; Generalized Pareto for the extreme tail. |
| **Inference & testing** | Chi-square for variance and goodness-of-fit; F for comparing variances and joint significance. |

---

## Block 1 · Stylised Facts of Financial Returns

### Slide 15 · Block 1 Intro
*The empirical regularities every risk model must capture.*
- Before modelling volatility, we look at what real daily return data actually looks like.
- **Three stylised facts**: fat tails, volatility clustering, near-zero autocorrelation in levels.

---

### Slide 16 · Exchange-Rate Changes: "Normally Distributed"?
Frequency of daily moves beyond *k* standard deviations — real world vs the normal model:

| Move | Real World (%) | Normal Model (%) |
|------|---------------:|-----------------:|
| > 1 SD | 23.32 | 31.73 |
| > 2 SD | 4.67 | 4.55 |
| > 3 SD | 1.30 | 0.27 |
| > 4 SD | 0.49 | 0.01 |
| > 5 SD | 0.24 | 0.00 |
| > 6 SD | 0.13 | 0.00 |

*Beyond 3 SD the real world massively exceeds the normal — the signature of fat tails.*

---

### Slide 17 · Heavy Tails
- Daily exchange-rate changes are **not** normally distributed.
- The distribution has **heavier tails** than the normal distribution.
- It is also **more peaked** than the normal distribution.
- This means both small changes and large changes are more likely than the normal would suggest.
- Many market variables have this property, known as **excess kurtosis**.

---

### Slide 18 · Normal and Heavy-Tailed Distribution
*(Chart)* Two overlaid densities with the same mean and variance: the heavy-tailed distribution is **taller and narrower in the middle** (more peaked) and has **fatter tails** at the extremes, crossing the normal twice on each side. The extra probability mass sits in the peak and the tails, taken from the "shoulders."

---

### Slide 19 · Simple vs Log Returns

**Two definitions**
- Simple return: $R_t = \dfrac{P_t - P_{t-1}}{P_{t-1}} = \dfrac{P_t}{P_{t-1}} - 1$
- Log return: $r_t = \ln\!\left(\dfrac{P_t}{P_{t-1}}\right) \approx R_t$ for small moves.
- **Log returns are time-additive**: the multi-day log return is the sum of the daily log returns.
- **Simple returns are portfolio-additive**: $R_p$ is the weighted sum of the constituent simple returns.

**Why risk management uses log returns**
- Additivity, symmetry and approximate stationarity make modelling tractable.
- Annualize: $\sigma_{\text{annual}} = \sigma_{\text{daily}} \times \sqrt{252}$ and $\bar{r}_{\text{annual}} = \bar{r}_{\text{daily}} \times 252$.
- Data: yfinance **adjusted Close** (accounts for splits and dividends), daily frequency.

---

### Slide 20 · The Lognormal Model and Square-Root-of-Time

**The lognormal price model (Jorion Ch. 5)**
- Prices follow **geometric Brownian motion**, so log returns are normal and prices are lognormal (never negative).
- The drift scales with time *t*; the standard deviation scales with $\sqrt{t}$ — the **square-root-of-time rule**.

**Why it matters for risk**
- Motivates log returns and the $\sqrt{252}$ annualisation used throughout EWMA and GARCH.
- Underpins $\sqrt{T}$ VaR scaling in Session 3: a 10-day VaR = 1-day VaR × $\sqrt{10}$ **IF** returns are i.i.d. with constant volatility.
- The rule **breaks under volatility clustering** — the GARCH term structure (later this session) is the correction.

---

### Slide 21 · Empirical Properties of Financial Returns

**1) Fat tails (leptokurtosis)**
- Excess kurtosis > 0 for most assets; S&P 500 daily kurtosis ≈ 10 to 20.
- The normal underestimates extreme events by an order of magnitude — VaR and ES need fat-tailed distributions.

**2) Volatility clustering**
- Large moves follow large moves; calm follows calm (Mandelbrot 1963).
- Returns $r_t$ show near-zero autocorrelation, but **squared returns $r_t^2$ are strongly autocorrelated**.

**3) Asymmetry (leverage effect)**
- Negative returns raise future volatility more than positive returns (Black 1976); return/vol-change correlation ≈ −0.7 for the S&P 500.
- Captured by **GJR-GARCH** and **EGARCH**.

**4) Near-zero autocorrelation of returns**
- Daily returns are largely unpredictable, consistent with **weak-form efficiency**.
- But $r_t$ and $r_t^2$ differ: volatility is predictable even when direction is not (Jorion Ch. 5).

---

### Slide 22 · Fat Tails: Normal vs Student-t

**The problem with the normal**
- Under the normal a 99% VaR sits at 2.33σ, and a 3-sigma day has probability 0.13%.
- The normal predicts a 3-sigma S&P 500 day about once per **741 years**; historically it is roughly once per **2 to 3 years**.
- **Jarque–Bera** rejects normality for virtually every daily return series.

**The fix: Student-t and EVT**
- The t(ν) distribution has heavier tails; typical ν ≈ 4 to 8; as ν grows it approaches the normal.
- GARCH(1,1) with t errors (`arch` library) captures fat tails inside a time-series model.
- **Extreme Value Theory** (Peaks-Over-Threshold with the GPD) models the tail directly.
- **Historical simulation** captures fat tails with no distributional assumption.

---

### Slide 23 · Volatility Clustering

**The statistical signature**
- Periods of high volatility cluster together in time.
- Returns $r_t$: autocorrelation ≈ 0 at all lags (random-walk-like).
- Squared returns $r_t^2$: strong positive autocorrelation out to 100+ lags.

**Why it matters**
- Rolling 21-day vol swings widely: GFC 2008 (≈ 80% annualised), COVID 2020 (≈ 90%).
- VIX (implied vol) correlates ≈ 0.85 with EWMA realised vol.
- A static historical σ is a poor risk measure — we need adaptive models (EWMA, GARCH).

---

## Block 2 · Volatility Models

### Slide 24 · Block 2 Intro
*Historical → EWMA → GARCH(1,1) — from Hull Ch. 8.*
- Historical rolling volatility is the simple baseline.
- EWMA weights recent data more heavily with a single decay factor.
- GARCH(1,1) adds a long-run level and mean reversion.

---

### Slide 25 · Standard Approach to Estimating Volatility
- Define $\sigma_n$ as the volatility per day between day $n-1$ and day $n$, as estimated at the end of day $n-1$.
- Define $S_i$ as the value of the market variable at the end of day $i$.
- Define $u_i = \ln(S_i / S_{i-1})$.

$$\sigma_n^2 = \frac{1}{m-1}\sum_{i=1}^{m}\left(u_{n-i} - \bar{u}\right)^2,\qquad \bar{u} = \frac{1}{m}\sum_{i=1}^{m} u_{n-i}$$

---

### Slide 26 · Simplifications Usually Made in Risk Management
- Define $u_i$ as $(S_i - S_{i-1})/S_{i-1}$.
- Assume that the mean value of $u_i$ is zero.
- Replace $m-1$ by $m$.

This gives:

$$\sigma_n^2 = \frac{1}{m}\sum_{i=1}^{m} u_{n-i}^2$$

---

### Slide 27 · Historical (Rolling) Volatility

**The simplest estimator**
- Sample standard deviation of log returns over a trailing window of *n* days (zero-mean simplification).
- RiskMetrics default n = 25; Basel internal-models minimum n = 250 trading days; annualise by $\sqrt{252}$.

**Strengths and weaknesses**
- **Pro**: simple, no parametric assumption, automatically captures fat tails.
- **Con**: equal-weights every observation — a big event stays in the estimate until it falls off the window.
- **Ghost effect**: vol drops sharply exactly *n* days after a shock even if markets stayed calm.
- Python: `rets.rolling(window).std() * np.sqrt(252)`.

---

### Slide 28 · Realized Volatility

**Measuring volatility from high-frequency data**
- Realized variance sums squared intraday returns over the day; realized vol is its square root.
- As sampling frequency rises, RV converges to the true (integrated) variance — a nearly model-free measure.
- Far more accurate than a single daily squared return as a volatility proxy.

**Why it matters (Andersen, Bollerslev, Diebold & Labys 2003)**
- Turns latent volatility into something we can observe and forecast directly.
- Serves as the realised benchmark when scoring EWMA and GARCH forecasts (the **QLIKE** loss).
- **Practical caveat**: microstructure noise and non-trading hours require careful sampling (e.g. 5-minute returns).

---

### Slide 29 · Weighting Scheme
Instead of assigning equal weights to the observations, we can set:

$$\sigma_n^2 = \sum_{i=1}^{m}\alpha_i\, u_{n-i}^2,\qquad \text{where}\quad \sum_{i=1}^{m}\alpha_i = 1$$

The $\alpha_i$ are the weights ($\alpha_i > 0$). Giving more weight to recent observations makes the estimate more responsive.

---

### Slide 30 · ARCH(m) Model
In an ARCH(m) model we also assign some weight to the **long-run variance rate** $V_L$:

$$\sigma_n^2 = \gamma V_L + \sum_{i=1}^{m}\alpha_i\, u_{n-i}^2,\qquad \text{where}\quad \gamma + \sum_{i=1}^{m}\alpha_i = 1$$

---

### Slide 31 · Exponentially Weighted Moving Average (EWMA)

$$\sigma_n^2 = \lambda\,\sigma_{n-1}^2 + (1-\lambda)\,u_{n-1}^2$$

**Interpretation**
- The weights assigned to the $u^2$ terms decline **exponentially** as we move back through time ($\propto \lambda^{i-1}$).
- No window length *n* — EWMA uses all past data with exponentially declining weights.
- **No ghost effect**: old shocks fade smoothly.
- RiskMetrics (J.P. Morgan, 1994) popularised **λ = 0.94** (daily) and **0.97** (monthly).
- We need only remember the current estimate of the variance rate and the most recent observation on the market variable.

---

### Slide 32 · GARCH(1,1)

$$\sigma_n^2 = \gamma V_L + \alpha\, u_{n-1}^2 + \beta\, \sigma_{n-1}^2 \;=\; \omega + \alpha\, u_{n-1}^2 + \beta\, \sigma_{n-1}^2$$

**The three terms**
- $\omega = \gamma V_L$ sets the long-run (unconditional) variance.
- **α** weights last period's squared return (the ARCH term — reaction to news).
- **β** weights last period's variance (the GARCH term — persistence).
- Typical S&P 500: α ≈ 0.15, β ≈ 0.84, α + β ≈ 0.99.

**Key quantities**
- **Persistence** α + β must be < 1 for stationarity; near 1 means shocks decay slowly.
- Long-run variance $V_L = \dfrac{\omega}{1 - \alpha - \beta}$; long-run vol $= \sqrt{252\,V_L}$.
- Estimated by **maximum likelihood** (`arch` library); EWMA is the special case ω = 0 (α + β = 1).

---

### Slide 33 · GARCH(1,1) Example
Suppose the parameters are $\omega = 0.000002$, $\alpha = 0.13$, $\beta = 0.86$:
- The long-run variance rate is $V_L = 0.0002$, so the long-run volatility per day is **1.4%**.
- Suppose the current volatility estimate is **1.6%** per day ($\sigma_{n-1}^2 = 0.000256$) and the most recent percentage change is **1%** ($u_{n-1}^2 = 0.0001$).

$$\sigma_n^2 = 0.000002 + 0.13(0.0001) + 0.86(0.000256) = 0.00023516$$

The new volatility (std dev) is $\sqrt{0.00023516} \approx$ **1.53% per day**.

*The volatility rose from 1.4% (long-run) toward the elevated current level, but the mean-reversion pulls it back below the 1.6% starting point.*

---

### Slide 34 · GARCH(1,1) — Properties and Intuition

**Mean reversion and persistence**
- When $\sigma_t^2$ exceeds $V_L$, the model forecasts a decline back toward $V_L$.
- Persistence α + β controls how slowly variance mean-reverts; S&P 500 half-life ≈ 60 to 70 days.
- **Student-t errors** (GARCH-t) improve the tail fit; typical ν ≈ 5 to 8.

**Diagnostics and extensions**
- Standardised residuals $z_t = r_t / \sigma_t$ should be approximately i.i.d.
- Model checks: Ljung–Box on $z_t^2$; AIC and BIC; QLIKE loss.
- Extensions: **GJR-GARCH** and **EGARCH** capture the leverage effect.
- Implementation: `arch_model(ret, vol='Garch', p=1, q=1, dist='t')`.

---

### Slide 35 · Volatility Model Comparison

**1) Historical rolling**
- Window *n* (default 21); equal weights; no parameters to estimate.
- Ghost effect and abrupt level shifts; good for regulatory disclosure (Basel n = 250).

**2) EWMA (RiskMetrics)**
- One fixed parameter λ (0.94 / 0.97); exponential decay, no ghost effect.
- No mean reversion (persistence = 1 by construction); good for short-horizon VaR and correlation.

**3) GARCH(1,1)**
- Three parameters ω, α, β; mean-reverts to the long-run variance $V_L$.
- Best multi-day forecast accuracy; captures clustering + mean reversion; good for multi-day VaR and stress testing.

**How to choose**
- QLIKE loss (Patton 2011); Mincer–Zarnowitz R²; LR test for nested models; AIC/BIC otherwise.
- GARCH usually wins on accuracy, EWMA on speed and simplicity; the lab does the formal comparison.

---

### Slide 36 · Forecasting Volatility — the GARCH Term Structure

**Reading the forecast**
- GARCH forecasts mean-revert to $V_L$ at rate (α + β) per day.
- Today's shock lifts the whole forward vol curve; high persistence means a slow decay.
- When $\sigma_t^2 > V_L$ the term structure slopes **down**; when below, it slopes **up**.

**Why it matters**
- EWMA cannot forecast forward (flat curve, persistence = 1).
- Explains why the naive $\sqrt{T}$ VaR rule fails when volatility is non-constant.
- Feeds 10-day VaR scaling in Session 3 and Assignment 1 (Hull Ch. 8).

---

### Slide 37 · Implied Volatility and the VIX

**Backward- vs forward-looking**
- Historical, EWMA and GARCH vols are estimated from past returns (**backward-looking**).
- Implied volatility is backed out of option prices via Black–Scholes (**forward-looking**).
- **VIX** = 30-day implied vol of S&P 500 options (CBOE), annualised — the "fear gauge".

**Using it**
- Crisis spikes ≈ 80% (GFC 2008) and ≈ 82% (COVID 2020) vs ≈ 12 to 20% in calm markets.
- Implied usually exceeds realised vol — the **variance risk premium**.
- VIX correlates ≈ 0.85 with EWMA realised vol — a real-time cross-check.
- Implied vol varies by strike — the **volatility smile/skew**, revisited in Session 8.

---

## Block 3 · Correlation, Covariance and Beta

### Slide 38 · Block 3 Intro
*The glue between assets — Hull Ch. 9 and Jorion Ch. 5.*
- Covariance and correlation summarise co-movement; beta measures sensitivity to the market.
- Correlations are dynamic and rise in crises; copulas capture the dependence that correlation misses.

---

### Slide 39 · Covariance and Correlation

**Definitions**
- Correlation ρ lies in **[−1, +1]**: +1 perfect co-movement, 0 no linear relation, −1 perfect opposite.
- The EWMA recursion extends to covariances, giving a **time-varying correlation matrix**.
- Portfolio variance is $\mathbf{w}^\top \Sigma\, \mathbf{w}$ — the fundamental object in portfolio risk.

**Properties**
- The covariance matrix Σ must be **positive semi-definite**.
- Hull Ch. 9 builds the EWMA correlation matrix; Jorion Ch. 5 uses risk-factor covariances in VaR.
- Correlation is **not** causation and captures only **LINEAR** dependence — nonlinear/tail dependence needs copulas.

---

### Slide 40 · Pearson vs Spearman Correlation

**Pearson — linear association on the raw values**
- Uses the actual sizes of the deviations from the mean; equals ±1 only for a straight-line relationship.
- Sensitive to outliers and marginal scale; feeds covariance and portfolio VaR ($\mathbf{w}^\top \Sigma \mathbf{w}$).

**Spearman — monotonic association on the ranks**
- Pearson applied to the ranks; equals ±1 for ANY increasing relationship, even a curved one.
- Robust to outliers (a rank shifts by at most 1) and works on ordinal data too.

**The decisive difference**
- Replace a variable by any increasing function (log, cube): **Spearman is unchanged, Pearson changes**.
- That scale-free, marginal-free property is why Spearman is the natural measure for a copula.

**When to use each**
- Use Pearson for linear, well-behaved data that feeds variance and VaR formulas. Use Spearman or Kendall for monotonic, fat-tailed, ordinal, or copula work. When in doubt, compute both and read the gap between them.

---

### Slide 41 · Computing Both Correlations: Example

**Pearson — on the raw values**
- Means $\bar{A} = 3$, $\bar{B} = 12$; the deviation products sum to 80; the squared-deviation sums are 10 and 1000.
- $r = 80 / \sqrt{10 \times 1000} = 80 / 100 = \mathbf{0.80}$.

**Spearman — on the ranks**
- Rank each stock 1 to 5; the ranks match exactly, so every $d = \text{rank}_A - \text{rank}_B$ is 0 and $\sum d^2 = 0$.
- $\rho_S = 1 - \dfrac{6(0)}{5 \times 24} = \mathbf{1.00}$.

**Read it**
- Perfectly ordered together (Spearman = 1.00) but not a straight line, because of the day-2 jump (Pearson = 0.80).

---

### Slide 42 · Seeing the Difference: Raw Values vs Ranks
*(Two scatter plots side by side.)*
- **Left (raw returns)**: four points line up, but the big up-day (5, 40) pulls the best-fit line off them, so **Pearson = 0.80**.
- **Right (ranks)**: every point sits exactly on the 45-degree line, so **Spearman = 1.00** — perfect order.
- Same data, two answers: Pearson penalises the nonlinearity and the outlier; Spearman sees only the ordering.

---

### Slide 43 · Beta and the Market Model

**The single-index (market) model**
- Regress a stock's return on the market-index return.
- $\beta = \dfrac{\operatorname{cov}(\text{stock}, \text{market})}{\operatorname{var}(\text{market})}$ — the slope of the OLS regression line.
- β > 1 amplifies market moves; β < 1 dampens them; α is the average return over and above the market fit.

**Systematic vs idiosyncratic risk**
- Total variance splits into **systematic** $\beta^2 \sigma_m^2$ plus **idiosyncratic** $\sigma_\varepsilon^2$.
- $R^2$ is the share of variance explained by the market; $1 - R^2$ is diversifiable.
- Risk-factor mapping (Jorion Ch. 5): express each asset through its betas to common factors.
- Explore this live in the Session 2 dashboard: beta scatter, rolling beta, and the variance split.

---

### Slide 44 · Estimation Risk and Shrinkage of the Covariance Matrix

**Why the sample covariance matrix is noisy**
- Σ has $n(n+1)/2$ free parameters — **465 for 30 assets** — estimated from limited data.
- When the number of assets approaches the sample length, sample Σ becomes unstable and ill-conditioned.
- Extreme sample correlations are often just noise, and portfolio optimisers amplify that error.

**Shrinkage as a remedy (Ledoit–Wolf)**
- Blend the noisy sample matrix *S* with a structured target *F*: $\hat{\Sigma} = \delta F + (1 - \delta) S$.
- The target is well-conditioned (e.g. constant-correlation or single-factor); δ is chosen optimally.
- Result: more stable correlations and better out-of-sample portfolio risk (Jorion Ch. 5).

---

### Slide 45 · Dynamic Correlations — Why They Vary

**Empirical evidence**
- Longin & Solnik (2001): correlations **rise in bear markets** and fall in bull markets.
- COVID-19 (Feb–Mar 2020) and the GFC 2008: equity-equity correlations jumped toward +1.
- Rolling 21-day is noisier than 63-day; **DCC-GARCH** (Engle 2002) models correlation dynamics.

**Risk-management implications**
- A static Σ understates crisis portfolio losses.
- Diversification evaporates exactly when needed — a common factor shock lifts all correlations.
- EWMA Σ adapts faster than a 63-day rolling window.
- The Gaussian copula underestimated 2008; the t-copula adds tail dependence (next slide).

---

### Slide 46 · Copulas — Capturing Non-Linear Dependence
- A copula is the **"glue"** that describes how variables move together, kept separate from how each one behaves alone. Its main payoff in risk is that it can say **whether things crash together**, which a single correlation number cannot.

**Tail dependence and the 2008 lesson**
- Tail dependence is the probability of joint extremes.
- **Gaussian copula**: no tail dependence.
- **t-copula**: positive tail dependence — some probability of joint crashes.
- The 2008 CDO crisis used the Gaussian copula where a t-copula was needed (Salmon 2009).

---

### Slide 47 · A Copula by Example: From Returns to Ranks
*(Illustration of ranks mapped to a unit square.)*

**The recipe**
- Rank each stock within its OWN history (1 = worst day, 10 = best).
- Convert ranks to uniforms: $u = \text{rank} / (n+1)$, so each margin is spread evenly on [0, 1].

**The copula sample**
- The 10 paired points $(u_A, u_B)$ **ARE** the copula.
- They keep the co-movement but forget the actual size of each move.
- You get the SAME copula even if you rescale a stock by any increasing function.

**Read one value**
- Both-below-median days ($u_A$ and $u_B \le 0.5$): days 2, 4, 6, 8 → $C(0.5, 0.5) = 4/10 = 0.40$.
- Independence would give 0.25 — the excess is the dependence.

---

### Slide 48 · Why Divide by n + 1? (Plotting Positions)

**10 points make 11 gaps**
- The 10 sorted returns cut the 0–100% probability line into $n + 1 = 11$ gaps (one below the min, one above the max).
- A new return is equally likely to land in any gap, so each gap is worth $1/11 = 9.1\%$; rank *k* sits at $k/11$.

**Why not divide by n (= 10)?**
- $k/n$ puts the largest at $u = 1.0$ (claiming you have seen the maximum possible) and makes $\Phi^{-1}(1) = +\infty$ in the normal-score step.
- $k/(n+1)$ leaves about 9% beyond each extreme (min at 0.091, max at 0.909) — symmetric and never exactly 0 or 1.

**The precise reason**
- For the *k*-th smallest of *n* draws, $\mathbb{E}[F(X_{(k)})] = k/(n+1)$: an unbiased estimate of its percentile (the **Weibull plotting position**).

---

### Slide 49 · A Copula by Example: Dependence and Tails

**Measure the co-movement**
- $C(0.5, 0.5) = 0.40$ vs 0.25 under independence: the stocks tend to be low together and high together.

**Read the tails**
- On Stock A's two worst days (2 and 8), Stock B is also in its worst two: **lower-tail dependence = 2 / 2**.
- A Gaussian copula forces tail dependence to zero — it would miss these joint crashes.
- A t-copula or Clayton copula keeps positive lower-tail dependence (the 2008 CDO lesson in miniature).

**Takeaway**
- A copula answers: *when A sits at its p-th percentile, where does B tend to be?*
- Correlation gives one average number; the copula also shows whether they reach the extremes together.

---

## Block 4 · Python Lab

### Slide 50 · Block 4 Intro
*Build your volatility toolkit — the foundation of Assignment 1.*
- Same tickers and date range as Session 1; extend the snapshot with EWMA, GARCH, beta and correlations.
- Save every output to CSV — these files are the direct inputs to Assignment 1 and the Session 3 VaR lab.

---

### Slide 51 · Python Lab — `Session_02_Lab.ipynb`

**Lab tasks**
1. Fetch data for your 3 stocks + index (same tickers/date range as Session 1).
2. Plot stylised facts: return series, ACF of $r$ and $r^2$, Q-Q plot, histogram vs Normal.
3. Annualised vol per stock; 21-day rolling vol; beta of each stock to the index (OLS).
4. Implement EWMA (λ = 0.94) by recursion; plot with rolling vol and VIX.
5. Fit GARCH(1,1) with t-errors (`arch`): ω, α, β, persistence, long-run vol, half-life.
6. Plot GARCH conditional vol + standardised residuals; check Ljung–Box.
7. Build the correlation matrix; plot rolling 63-day correlations.
8. Compare the three vol forecasts (QLIKE); save all outputs to CSV.

**Discuss**
- Which model best tracks your portfolio's risk regimes?
- How did correlations behave during COVID-19 or a 2022 shock?
- What does GARCH persistence imply for a 10-day VaR forecast?

---

### Slide 52 · Session Wrap-Up

**Key takeaways**
- Log returns are time-additive; annualise vol by $\sqrt{252}$ and mean by 252.
- Returns show **fat tails, volatility clustering and near-zero autocorrelation** — the three stylised facts.
- EWMA adapts with one parameter; GARCH(1,1) adds mean reversion and a long-run variance.
- Beta from the market model splits risk into systematic (undiversifiable) and idiosyncratic parts.
- Correlations spike toward +1 in crises, destroying diversification when it matters most (Longin & Solnik 2001).

**Next session — Session 3: Value-at-Risk**
- Parametric (normal and t) VaR, historical simulation, Monte Carlo VaR, Basel traffic-light test.
- Read Hull Ch. 11–13.
