# Financial Risk Management

Coursework for **FRME, Spring 2026**: eleven lecture labs and three graded assignments
covering market, credit, liquidity, operational, and systemic risk.

![Python](https://img.shields.io/badge/Python-3.13-3776AB?logo=python&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-notebooks-F37626?logo=jupyter&logoColor=white)
![Sessions](https://img.shields.io/badge/sessions-11-blue)
![Assignments](https://img.shields.io/badge/assignments-3-success)
![Data](https://img.shields.io/badge/data-pinned%20snapshots-lightgrey)

Everything here runs offline. Market data is pinned to dated CSV snapshots that sit
next to the notebook that loads them, so every figure in the write-ups reproduces
exactly rather than shifting with whatever the market did today.

---

## Assignments

| # | Topic | Notebook | Data |
|---|-------|----------|------|
| **A1** | Market risk: portfolio VaR, Expected Shortfall, backtesting | [`assignment_1.ipynb`](assignments/A1/assignment_1.ipynb) | `my_portfolio.csv` |
| **A2** | Credit, liquidity, and operational risk | [`assignment_2.ipynb`](assignments/A2/assignment_2.ipynb) | `a2_ohlcv.csv` |
| **A3** | Portfolio optimization, stress testing, systemic risk | [`assignment_3.ipynb`](assignments/A3/assignment_3.ipynb) | `a3_esg_scores.csv` |

All three are also exported together as
[`FRME_Assignments_1-3.pdf`](assignments/FRME_Assignments_1-3.pdf) and `.html`.

Each assignment folder is self-contained and holds the same four things: the brief
as a PDF, the brief transcribed as a task checklist (`assignment_N.R`), the marker's
feedback (`corrections_N.R`), and the notebook with its pinned data.

## Lecture sessions

| Session | Topic |
|---------|-------|
| `L1` | Risk landscape and types of risk |
| `L2` | Market risk basics |
| `L3` | Value at Risk |
| `L4` | Expected Shortfall and backtesting |
| `L5` | Credit risk I, single name |
| `L6` | Credit risk II, portfolio |
| `L7` | Liquidity and operational risk |
| `L8` | Derivatives (with a QuantLib supplement) |
| `L9` | Portfolio risk, optimization, and factor models |
| `L10` | Portfolio optimization II and Black-Litterman |
| `L11` | Regulatory, systemic, model and ESG risk, stress testing |

Every session folder holds the slides for the concepts, and nearly all of them add a
notebook for the code plus whatever data it loads. `L10` is the exception: its
material is a worked cheatsheet and two Black-Litterman write-ups rather than a lab.

## What is actually implemented

**Market risk** — historical, parametric and Monte Carlo VaR, Student-t and
EWMA/GARCH volatility, Expected Shortfall, Kupiec and Christoffersen backtests.

**Credit risk** — Merton distance to default, PD and LGD, expected loss, credit
migration, and portfolio loss distributions.

**Liquidity and operational risk** — spread and volume based liquidity measures,
liquidity-adjusted VaR, and loss-distribution modelling for operational events.

**Portfolio construction** — efficient frontier, minimum-variance and tangency
portfolios, risk parity, Black-Litterman, shrinkage covariance, and ESG tilts.

**Stress testing** — scenario construction, sensitivity analysis, and Basel capital
requirements.

## Layout

```
assignments/
  A1/ A2/ A3/        brief (PDF + .R), feedback, notebook, pinned CSV
  FRME_Assignments_1-3.{ipynb,pdf,html}
lectures/
  L1/ ... L11/       slides (.pptx), notebook, session data
```

## Running it

Python 3.13 with Jupyter. The notebooks use:

```
pandas   numpy    scipy       matplotlib   seaborn
arch     yfinance statsmodels scikit-learn PyPortfolioOpt   QuantLib
```

Clone, open any notebook, and run it top to bottom. Simulations are seeded and the
CSV snapshots are committed, so results match what is written in the markdown cells.

Data is loaded by relative path (`'my_portfolio.csv'`, `'../A1/my_portfolio.csv'`),
never by absolute path, so the folders can move without breaking anything.

## Notes on data

The CSV files are course-provided reference tables and dated market snapshots kept
purely so the analysis reproduces. No live market feeds, API keys, or credentials
are stored in this repo.

---

*Maintained by elruva. Work in progress, updated as the course goes.*
