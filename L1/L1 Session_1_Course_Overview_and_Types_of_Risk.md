# Financial Risk Management and Engineering
## Session 1 — Course Overview and Types of Financial Risks

---

### Slide 2 · Learning Objectives
By the end of this session, you will be able to:
1. Describe the goals, process, and governance of financial risk management.
2. Identify and distinguish the **six risk categories**: market, credit, liquidity, operational, systemic, ESG/climate.
3. Understand the three-assignment portfolio exam and how each session feeds it.
4. Acquire and inspect real market data for your own exam portfolio.

---

### Slide 3 · What Is Financial Risk?
Financial risk arises whenever the future value of an asset, liability, or cash flow is uncertain.

- Risk = uncertainty about future outcomes that affect financial value.
- Two dimensions: **probability of loss × magnitude of loss**.
- Risk is not inherently bad.
- There is a trade-off between risk and expected return: the higher the risk, the higher the expected return.
- No risk → risk-free return.
- Risk management: **identify, measure, monitor, and control** risk.
- Key question: *which risks are worth taking, and at what price?*

---

### Slide 4 · Risk and Return
Suppose the government bond yield (risk-free rate) is **2%** and two equity investments each cost **DKK 100** today.

| Scenario | Probability | Asset 1 Ending Value | Asset 2 Ending Value |
|----------|-------------|----------------------|----------------------|
| Excellent | 0.4 | 120 | 125 |
| OK | 0.4 | 105 | 112 |
| Bad | 0.2 | 100 | 95 |

Discussion questions:
- Which asset has higher risk/return?
- Which is a better investment?

---

### Slide 5 · Portfolio Risk and Return
Now combine the assets in a portfolio (weights `w1` on Asset 1, `w2` on Asset 2):

| w1 (Asset 1) | w2 (Asset 2) | Expected Return (%) | Risk / Std Dev (%) |
|:---:|:---:|:---:|:---:|
| 0.0 | 1.0 | 13.80 | 11.05 |
| 0.2 | 0.8 | 13.04 | 9.48 |
| 0.4 | 0.6 | 12.28 | 8.28 |
| 0.6 | 0.4 | 11.52 | 7.62 |
| 0.8 | 0.2 | 10.76 | 7.65 |
| 1.0 | 0.0 | 10.00 | 8.37 |

*Note the key insight: mixing the two assets can produce a portfolio with **lower risk than either asset alone** (the minimum-risk combination here sits around w1 ≈ 0.6, std dev ≈ 7.62%). This is diversification at work.*

---

### Slide 6 · Portfolio Efficient Frontier
*(Chart)* A plot of portfolio **risk (std dev, x-axis)** against **expected return (y-axis)** for the two-asset combinations above. The points trace a curved "bullet" shape; the upper portion of the curve — offering the highest return for each level of risk — is the **efficient frontier**.

---

### Slide 7 · Efficient Frontier for Many Assets
*(Chart)* With many assets, individual securities scatter inside a region. The **left/upper boundary** of that region is the efficient frontier — the set of portfolios that maximise return for a given risk (or minimise risk for a given return). Portfolios below the frontier are dominated (inefficient).

---

### Slide 8 · Efficient Frontier for Two Assets
*(Chart)* The two-asset case: as the weight shifts from 100% Asset 2 to 100% Asset 1, the combinations sweep out a curved line in risk–return space. Curvature comes from the correlation between the two assets — the less correlated they are, the more the curve bows leftward (greater diversification benefit).

---

### Slide 9 · The Risk Management Process
A four-stage cycle:

**1. Identify** — Map all risk exposures; risk register & heat map; qualitative + quantitative; include tail & scenario risks.

**2. Measure** — Quantify via models & data; VaR, ES, credit metrics; sensitivity analysis; stress tests & Monte Carlo.

**3. Monitor** — Track exposures over time; dashboards & limit checks; early-warning indicators; backtest model accuracy.

**4. Control** — Hedging & derivatives; position limits & stop-losses; capital allocation (RAROC); governance & regulation.

---

### Slide 10 · Why Risk Management Matters

**Historical Failures**
- **GFC 2008**: tail risk & contagion underestimated.
- **LTCM 1998**: leverage + model risk; ~$4.6B loss.
- **Barings 1995**: rogue trader (Nick Leeson); ~$1.3B.
- **Enron 2001**: accounting & off-balance-sheet risk.
- **JPMorgan "London Whale" 2012**: ~$6.2B.

**Key Lessons**
- Models have limits — validate and stress-test.
- Tail risks become correlated in crises.
- Culture and governance matter as much as models.
- Leverage amplifies every type of risk.
- Disclosure reduces systemic fragility.

---

### Slide 11 · Market Risk & Credit Risk (Two Major Risks)

**Market risk**
- Loss from market-price movements.
- Equity, FX, interest-rate, commodity risk.
- Measured by VaR, ES, Greeks, DV01.
- Basel III FRTB: 97.5% ES replaces VaR.
- Models: GARCH, historical simulation, Monte Carlo.

**Credit risk**
- Counterparty fails to meet obligations.
- Expected loss = **PD × LGD × EAD**.
- Unexpected loss drives regulatory capital.
- Structural (Merton) & intensity models.
- Ratings: S&P, Moody's, Fitch.

---

### Slide 12 · Liquidity Risk & Operational Risk

**Liquidity risk**
- Market liquidity: cannot exit without price impact.
- Funding liquidity: cannot meet obligations when due.
- Amihud illiquidity ratio; bid-ask spread.
- Liquidity Coverage Ratio (LCR) ≥ 100%.
- Net Stable Funding Ratio (NSFR) ≥ 100%.

**Operational risk**
- Failed processes, people, systems, external events.
- Fraud, cyber, legal & compliance failures.
- Basel II: BIA / TSA / AMA approaches.
- Basel III final: single Standardised Approach.
- Modelled with **Poisson frequency × lognormal severity**.

---

### Slide 13 · Systemic Risk & ESG/Climate Risk

**Systemic risk**
- **CoVaR**: VaR of the system given firm *i* is in distress.
- **ΔCoVaR**: firm *i*'s incremental contribution to system risk.
- **SRISK** (Brownlees & Engle 2017): expected capital shortfall in a crash.
- **MES**: a firm's average loss on the market's worst days.
- Individually rational behaviour can be collectively destructive.

**ESG/Climate risk**
- Loss from environmental, social & governance factors.
- Physical risk: floods, droughts, wildfires, sea-level rise.
- Transition risk: policy, carbon pricing, stranded assets.
- Long-horizon, correlated, hard to model — diversification limited.

---

### Slide 14 · ESG & Climate Risk
ESG and climate risk are now treated as mainstream by the **FSB, ECB, and Bank of England**.

- Physical risk: floods, droughts, wildfires, sea-level rise.
- Transition risk: policy, carbon pricing, stranded assets.
- Liability risk: claims against high-emitters and their financiers.
- Disclosure: TCFD, EU taxonomy, IFRS S1/S2 (ISSB), SEC climate rule.
- **"Green Swan"** (BIS 2020): unprecedented, hard-to-model climate tail risk.
- ESG ratings disagree across providers — measurement is itself a risk.

---

### Slide 15 · Comparing the Six Risk Categories

| Category | Characteristics |
|----------|-----------------|
| **Market & Credit** | Most quantified; longest history. Basel capital charges well established. VaR, ES, PD/LGD/EAD models. |
| **Liquidity** | Hard to model; highly non-linear. Crises amplify all other risks. LCR / NSFR are post-GFC tools. |
| **Operational** | Non-financial origin; data scarce. Fat-tailed loss distribution. Culture & governance paramount. |
| **Systemic & ESG** | Macro-level; network externalities. Contagion & fire-sale spirals. ESG newest; data still evolving. |

---

### Slide 16 · Nature of Banking
- **Commercial banking**
  - Taking deposits, making loans (wholesale or retail).
  - Money-center banks operate in the wholesale market and often fund loans by borrowing.
- **Investment banking**
  - Raising debt and equity for companies; advice on mergers and acquisitions, restructurings, trading, etc.

---

### Slide 17 · Example of Simple Bank Balance Sheet (2025)

| Assets (mln. $) | | Liabilities (mln. $) | |
|-----------------|---:|----------------------|---:|
| Cash | 5 | Deposits | 90 |
| Marketable Securities | 10 | Long-Term Debt | 5 |
| Loans | 80 | Equity | 5 |
| Fixed Assets | 5 | | |
| **TOTAL** | **100** | **TOTAL** | **100** |

---

### Slide 18 · Income Statement (2025)
Question: *What happens in year 2026 if it is the same as 2025 except that the provision for loan losses is **4.0** instead of **0.8**?*

| Income Statement (mln. $) | |
|---------------------------|---:|
| Net Interest Income | 3.0 |
| Provision for Loan Losses | −0.8 |
| Non-Interest Income | 0.9 |
| Non-Interest Expense | −2.5 |
| **Pre-tax Income** | **0.6** |

*If provisions rise to 4.0, pre-tax income falls by 3.2 (from 0.8 → 4.0), turning +0.6 into **−2.6** — which wipes out the 5.0 of equity by more than half in a single year.*

---

### Slide 19 · How the 6 Risks Affect the Bank (Part 1)

**Market risk**
- *Hits*: securities (10) marked down; rate rises compress net interest income (3.00).
- *Manage*: duration-gap / ALM, interest-rate swaps, VaR & ES limits.

**Credit risk**
- *Hits*: loan (80) defaults raise loan-loss provisions — 0.80 → 4.00 turns +0.60 into −2.60.
- *Manage*: underwriting limits, diversification, collateral, provisioning, capital buffer.

**Liquidity risk**
- *Hits*: only 15 liquid assets vs 90 deposits; runs force fire-sale losses.
- *Manage*: HQLA buffers (LCR/NSFR), diversified funding, contingency funding plan.

---

### Slide 20 · How the 6 Risks Affect the Bank (Part 2)

**Operational risk**
- *Hits*: fraud, cyber, fines land in non-interest expense (2.50).
- *Manage*: internal controls, cyber resilience, insurance, op-risk capital.

**Systemic risk**
- *Hits*: funding, asset values, defaults strike at once — 5 equity too small.
- *Manage*: extra capital/liquidity buffers, less concentration, stress tests, resolution plans.

**ESG / climate risk**
- *Hits*: stranded loans → future provisions; physical damage to collateral; liability costs.
- *Manage*: climate stress tests, sector exposure limits, decarbonize, price into spreads.

---

### Slide 21 · What If the Balance Sheet Had Been More Aggressive?

| Assets (mln. $) | | Liabilities (mln. $) | |
|-----------------|---:|----------------------|---:|
| Cash | 5 | Deposits | 94 |
| Marketable Securities | 10 | Long-Term Debt | 5 |
| Loans | 80 | Equity | 1 |
| Fixed Assets | 5 | | |
| **TOTAL** | **100** | **TOTAL** | **100** |

*With only **1** of equity (vs 5 before), the same 4.0 loan-loss provision shock renders the bank insolvent almost immediately — illustrating how leverage amplifies every risk.*

---

### Slide 22 · Regulation
- Regulators set minimum levels for the capital a bank is required to keep.
- Equity is an example of **Tier 1 capital**.
- Subordinated long-term debt is an example of **Tier 2 capital**.

---

### Slide 23 · Deposit Insurance
- Most countries have deposit-insurance programs that insure depositors against losses up to a certain level.
- In the US the **FDIC** has provided protection for depositors since 1933.
- The amount insured was **$2,500 in 1933** and has been increased several times.
- Following the credit crisis it was increased from **$100,000 to $250,000 in October 2008**.
- Discussion: *Why might deposit insurance encourage a bank to take risks?* (moral hazard)

---

### Slide 24 · Course Roadmap
- **S1** — Course overview & the six types of financial risk.
- **S2** — Market-risk basics: returns, volatility, correlation.
- **S3** — Value-at-Risk: parametric, historical, Monte Carlo.
- **S4** — Expected Shortfall & backtesting.
- **S5–6** — Credit risk: Merton & spreads; intensity & portfolio copula models.
- **S7** — Liquidity & operational risk.
- **S8** — Derivatives in risk management: binomial & Black–Scholes.
- **S9–10** — Portfolio risk & optimization: mean-variance; risk parity, robust, ESG.
- **S11** — Regulatory risk & stress testing (Basel III).
- **S12** — Systemic risk & model risk.
- **S13** — Review — key topics & exam Q&A.

---

### Slide 25 · The Portfolio Exam
Assessment is **one portfolio exam** — three assignments you build across the course and finalise after collective feedback on your drafts.

- Three individual assignments, **equally weighted**; everyone's portfolio differs.
- Deliverable: one executable **Jupyter notebook (.ipynb) + PDF export + your data snapshot**.
- Submit via **WISEflow**; graded on the Danish **7-point scale**.
- Length: **≤10,000 narrative characters per assignment** (code & figures excluded); **≤30,000 total**.
- Attendance: **11 days required** to be eligible to sit the exam.
- AI/LLM tools (ChatGPT, Claude) are permitted and encouraged — **verify every number against your own output**.
- Marked on correct **method and interpretation of YOUR results**, not code volume.

---

### Slide 26 · How the Course Builds Your Exam

**Assignment 1 · Market Risk** (Sessions 2–4)
- Volatility, correlation, beta.
- VaR: parametric / historical / MC.
- Expected Shortfall; GARCH(1,1).
- Basel traffic-light backtest.

**Assignment 2 · Credit, Derivatives, Liquidity, Operational** (Sessions 5–8)
- Merton distance-to-default & PD.
- Gaussian-copula Credit VaR.
- Black–Scholes / binomial Greeks.
- Liquidity-adjusted VaR; op-loss simulation.

**Assignment 3 · Optimisation & Systemic** (Sessions 9–12)
- Mean-variance frontier; risk parity.
- Black–Litterman; robust/shrinkage.
- ESG tilt; stress tests (Basel III).
- CoVaR; 1/N out-of-sample test.

**Across the board**
- Real-data acquisition (yfinance).
- Reproducible snapshot, clean data.
- Interpretation anchored to YOUR numbers.
- Critical limits & regulatory framing.

---

### Slide 27 · Acquiring Your Own Data
- **Stock 1**: a listed company starting with your **FIRST-name initial**.
- **Stock 2**: a listed company starting with your **LAST-name initial**.
- **Stock 3**: a different sector, so the portfolio is diversified.
- **Single-bloc rule**: all three trade in one bloc, benchmarked to that bloc's index.
  - North America → S&P 500 (`^GSPC`); all-Canadian → S&P/TSX (`^GSPTSE`).
  - Europe incl. UK → STOXX Europe 600 (`^STOXX`); all-London → FTSE 100 (`^FTSE`).
- **Why one bloc**: beta is only meaningful within one trading calendar & currency area.
- **Verify in Python**: ≥3 years daily history, plus market cap & total debt (for Assignment 2).
- **Reproducibility**: pin an end-date, download once, save a CSV snapshot.
- ★ **DO IT NOW**: write down YOUR three tickers + bloc index — they are your lab universe today and your exam portfolio all term.

> *Your exam portfolio:* **AAPL / PFE / XOM**, benchmarked to **`^GSPC`** (S&P 500, North America bloc).

---

### Slide 28 · Working in Jupyter: Habits & Quick Fixes
The four habits and four fixes that save the most hours (full table in the Getting-Started primer):

**Habits**
- Run cells **top to bottom** — order matters; when in doubt, *Kernel ▸ Restart & Run All*.
- `Tab` = autocomplete; `Shift+Tab` inside `()` shows a function's arguments.
- A variable alone on the last line prints it; `display(df)` for pretty tables.
- Markdown cells for notes & math — the exam is graded on explanation, not code.

**Fixes**
- `ModuleNotFoundError` → `pip install <name>`, then restart the kernel.
- `NameError` → you skipped the cell that defines it; run from the top.
- yfinance returns nothing → rate limit; the cached CSV snapshot makes you immune.
- Stuck? Read the **LAST line of the traceback first** — then paste it into the AI.

---

### Slide 29 · Python Lab
**Notebook:** `Session_01_Risk_Landscape_Notebook.ipynb`

**Lab Tasks**
1. Run Blocks 0–1 together: load 5 years of real data; returns, volatility, Sharpe, drawdown.
2. Block 2: the fat-tails histogram — how far real returns depart from the normal.
3. Block 3: the six risk categories seen in one dataset (heatmap; market vs credit panels).
4. Block 4: the reproducible exam workflow — pin dates, download once, snapshot to CSV.
5. "Your Turn" Part A — download YOUR three exam tickers (picked earlier) + bloc index.
6. **GOAL before you leave**: Part A done — your own data on your own machine, snapshotted.
7. Parts B–E (returns, risk picture, reflection) are tonight's homework.
8. Optional extra practice: `Session_01_Extra_Practice.ipynb` (ETF cross-asset version).

**Discuss**
- Which risk category explains your stocks' extreme days?
- How far does your histogram depart from the normal overlay (fat tails)?
- This exact workflow **IS the opening of Assignment 1** of your exam.

---

### Slide 30 · Required Readings & References

**Required**
- Hull, J. C. (2023). *Risk Management and Financial Institutions*, 6e. **Ch. 1**: Introduction — Risk-Return Trade-offs.
- Jorion, P. (2010). *Financial Risk Manager Handbook*, 6e. **Ch. 1**: Risk Management.

**Supplementary**
- Stulz, R. M. (1996). Rethinking risk management. *J. Applied Corporate Finance*, 9(3), 8–25.
- Manganelli, S., & Engle, R. F. (2001). Value at risk models in finance. ECB WP No. 75.
- TCFD (2017). Recommendations of the Task Force on Climate-related Financial Disclosures. FSB.
- Nocera, J. (2009). Risk mismanagement. *New York Times Magazine*, 4 Jan 2009.

---

### Slide 31 · Session Wrap-Up

**Key Takeaways**
- ✓ Financial risk spans **six categories**: market, credit, liquidity, operational, systemic, ESG/climate.
- ✓ Risk management is a cycle — **identify → measure → monitor → control** — inside a governance structure.
- ✓ Historical failures (GFC 2008, LTCM 1998) and regulation (Basel, TCFD) shape today's practice.
- ✓ Your assessment is a **three-assignment portfolio exam** built on data you fetch yourself.
- ✓ Python (pandas, NumPy, scipy, arch, yfinance) is our tool throughout — starting today.

**Next Session — Session 2: Market Risk Basics**
- Simple vs. log returns.
- Fat tails & volatility clustering.
- EWMA & GARCH(1,1).
- Correlation & copulas.

**Tonight**: "Your Turn" Parts B–E with your own tickers.
**Optional**: `Session_01_Extra_Practice.ipynb`.
**Read**: Hull Ch. 8 (Volatility) & Ch. 9 (Correlations and Copulas).
