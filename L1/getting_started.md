# Getting Started: Python & VS Code

*A Student Onboarding Primer · Financial Risk Management and Engineering with Python*

**Who this is for.** Everyone in the course — whether you've never opened a Jupyter notebook or you already code. It gets your tools installed and working, teaches the handful of Python ideas you actually need this term, and shows the exact data workflow every assignment uses. You don't need to memorise anything: keep this open beside the notebooks and copy-run-tweak.

**How to use it.** Do **Part 0 tonight** so your environment is green before class. Skim Parts 1–3 to learn the tools, and treat Parts 4–5 as a reference you return to whenever a notebook cell puzzles you. Every code box is runnable — type it into a notebook cell and press Shift+Enter.

---

## 0. Set Up Your Environment (do this before Class Session 1)

You will install three free things: **Anaconda** (Python + Jupyter + all the libraries in one bundle), **VS Code** (your editor), and **GitHub Copilot** (the AI assistant that's free for students inside VS Code). Budget about 30 minutes.

### 0.1 Install Anaconda — gives you Python and (almost) every package
- Download the **Anaconda Distribution** for your OS and run the installer with default options → [anaconda.com/download](https://www.anaconda.com/download)
- Anaconda bundles Python 3, Jupyter, and numpy / pandas / matplotlib / scipy — the core of everything we do. Installing it means you rarely have to install anything else.
- You can create/open/run Jupyter notebooks in Anaconda, but installing VS Code (next) lets you use AI tools to make writing/editing code easier.

> **TIP — Why Anaconda instead of plain Python?** It sidesteps the most common beginner problem: a half-installed scientific stack. If you already have a Python you love, keep it; otherwise use Anaconda.

### 0.2 Install VS Code — your editor for the whole course
- Download **VS Code**, a free editor from Microsoft. Run the installer with default options → [code.visualstudio.com](https://code.visualstudio.com)
- We use it in every session. It opens Jupyter notebooks directly, runs your code, and hosts the GitHub Copilot AI assistant you set up next.

> **TIP — VS Code is free and cross-platform.** Same on Windows, macOS, and Linux, opens notebooks natively, and stays useful long after this course.

### 0.3 Claim your free GitHub Copilot (student pack)
- **Verify as a student** through the *GitHub Student Developer Pack* using your university email → [education.github.com/pack](https://education.github.com/pack)
- Install the **GitHub Copilot** extension in VS Code (Extensions panel → search "GitHub Copilot"), then sign in with the verified account.

> **TIP — Use your university email.** The pack verifies eligibility from your @university address — no credit card needed.

### 0.4 Wire up the notebook — the one setting that trips everyone
- In VS Code, install the **Python** extension and the **Jupyter** extension (both by Microsoft).
- Open any `.ipynb` file (try the Session 1 notebook on Brightspace → Content → Session 1), then at the top-right **select the Anaconda interpreter as the kernel** (usually shown as something like `Python 3.12 ('base')`).

> **WATCH OUT — "Nothing runs" / "Kernel not found."** This is almost always the kernel. Click the kernel picker (top-right) and choose Anaconda / base Python. Still failing? Close and reopen the folder.

### 0.5 Install the course packages and self-check
Most packages ship with Anaconda; a few (`yfinance` and, later, `PyPortfolioOpt` / `arch`) don't. Install the whole set in one line. Put this in a notebook cell (the leading `!` runs a terminal command), or run it without the `!` in a terminal:

```bash
!pip install yfinance pandas numpy matplotlib seaborn scipy statsmodels scikit-learn PyPortfolioOpt arch
```

Then run the environment-check cell that opens every course notebook. It prints a version for each package, or tells you exactly what to install:

```python
import importlib, sys
print('Python', sys.version.split()[0], '\n')

for pkg in ['numpy', 'pandas', 'matplotlib', 'scipy', 'yfinance', 'seaborn']:
    try:
        m = importlib.import_module(pkg)
        print(f' {pkg:13s} {getattr(m, "__version__", "ok")}')
    except Exception:
        print(f' {pkg:13s} NOT INSTALLED -> pip install {pkg}')
```

> **TIP — Every line green? You're done.** If any line says NOT INSTALLED, run the pip line above, then Kernel → Restart & Run All. You only do this setup once.

### 0.6 No admin rights? Use Google Colab
If you can't install software on your machine, [Google Colab](https://colab.research.google.com) runs any course notebook free in the browser. Upload the `.ipynb`, add a first cell with the pip line above, and run. A perfectly valid way to do the whole course.

---

## 1. Working in VS Code

VS Code is a folder-based editor. You open the course materials folder once, and the file tree on the left (the Explorer) lets you jump between notebooks.

- **Open a folder:** File → Open Folder. Your notebooks appear in the Explorer.
- **Command Palette:** Cmd+Shift+P (Mac) / Ctrl+Shift+P (Windows). Type what you want to do — every command lives here.
- **Run a notebook cell:** click into it and press Shift+Enter. Run everything cleanly with **Restart & Run All**.
- **Integrated terminal:** Terminal → New Terminal, for typing pip install commands.

---

## 2. AI Assistants — GitHub Copilot & Anaconda Assistant

You have two free AI helpers this term. Use **GitHub Copilot** in VS Code, and **Anaconda Assistant** inside Anaconda's Jupyter tools. Both explain errors, draft code from a plain-English request, and comment code you don't yet understand.

### 2.1 GitHub Copilot (in VS Code)
- **Ghost-text suggestions.** As you type (or after a comment describing what you want) Copilot suggests the rest in grey. Press Tab to accept, or keep typing to ignore.
- **Copilot Chat.** Open the chat panel (chat icon in the sidebar, or Ctrl+Alt+I) and ask it to explain a cell, generate a plot, or debug an error in plain English.

### 2.2 Anaconda Assistant (in Jupyter / Anaconda)
A free AI helper in Anaconda Navigator and the anaconda.cloud notebook editor. If you run notebooks through Anaconda rather than VS Code, it sits in a side panel and does the same job as Copilot Chat.
- **Ask in plain English.** Explain a cell, write a snippet, or add comments — then read the code before you run it.
- **Explain an error.** Paste a red traceback and ask what went wrong.

> **TIP — The single most useful habit for beginners.** When a cell throws a red error, copy the whole message into Copilot Chat or the Anaconda Assistant and ask "what's wrong and how do I fix it?" You'll solve 90% of problems this way.

> **WATCH OUT — AI is a co-pilot, not an oracle.** Great at boilerplate (loops, plots, reading a CSV) and explaining errors. Unreliable on finance conventions — the sign of a VaR, log vs simple returns, annualisation factors. Always check a number against the definition in the notes. See Part 6.

---

## 3. Jupyter Notebook Literacy

A notebook is a stack of cells you run one at a time. Two cell types: **code cells** (run Python) and **Markdown cells** (formatted text and math). This is the format of every session notebook and every exam assignment.

### 3.1 Running cells and the golden rule
- **Run a cell:** Shift+Enter runs it and moves on; Ctrl+Enter runs it in place.
- **The execution counter:** `[ ]` = never run, `[*]` = running now, `[5]` = the 5th cell you ran.

> **WATCH OUT — The #1 notebook bug: running cells out of order.** A notebook remembers state from whatever you ran, in whatever order. If results look wrong, do **Kernel → Restart & Run All** to re-run everything cleanly from the top. Always run top to bottom.

### 3.2 Seeing output
- `print(x)` shows a value as plain text.
- A **bare variable on the last line** of a cell displays it nicely (a DataFrame becomes a table).
- `display(df)` forces the pretty table view anywhere in a cell. Plots appear inline automatically.

### 3.3 Essential keyboard moves (press Esc first to leave a cell)

| Key | Does |
|---|---|
| Esc then A / B | Insert a cell Above / Below |
| Esc then M / Y | Turn cell into Markdown / code |
| Esc then D D | Delete the cell (press D twice) |
| Shift+Enter | Run the cell and move to the next |
| Interrupt button (square) | Stop a cell stuck on `[*]` |

---

## 4. Python Essentials — only what this course uses

You'll mostly read and lightly edit code rather than write it from scratch. These are the ideas that recur in every notebook. Type each box into a cell and run it.

### 4.1 Variables, numbers, and f-strings
A variable is a name for a value. f-strings (an `f` before the quotes) drop values into text — we use them constantly to label results.

```python
price = 187.5
shares = 10
value = price * shares
print(f'Position value: ${value:,.2f}')   # Position value: $1,875.00
```

### 4.2 Lists, dictionaries, and indexing
A list is an ordered collection; a dictionary maps keys to values. Indexing starts at 0; negative indices count from the end.

```python
tickers = ['SPY', 'AAPL', 'JPM']
print(tickers[0], tickers[-1])            # SPY JPM
settings = {'start': '2021-07-01', 'rf': 0.04}
print(settings['rf'])                     # 0.04
```

### 4.3 Loops, conditionals, and comprehensions
A for-loop repeats an action; an if/else chooses between actions. A list comprehension builds a list in one compact line.

```python
for t in tickers:
    print('Loading', t)

returns = [0.01, -0.03, 0.02]
flags = ['loss' if r < 0 else 'gain' for r in returns]
print(flags)                              # ['gain', 'loss', 'gain']
```

### 4.4 Functions and imports
A function is a reusable recipe you call by name. `import` brings in a library, usually with a short alias.

```python
import numpy as np

def annualise_vol(daily_std):
    return daily_std * np.sqrt(252)

print(annualise_vol(0.012))               # ~0.190 (19% per year)
```

> **TIP — The three aliases you'll see every day:** `import numpy as np` (math), `import pandas as pd` (tables), `import matplotlib.pyplot as plt` (charts).

### 4.5 Reading an error message
Errors look scary but are helpful. Read the **last line first** — it names the problem.

| Error | Usually means |
|---|---|
| ModuleNotFoundError | Package not installed → run `pip install <name>`, then restart |
| NameError | You used something before running the cell that defines it (run top-down) |
| KeyError | A column or dictionary key that isn't there — check spelling / the data |
| ValueError / TypeError | Wrong kind of value passed to a function — read the last line |

---

## 5. The FRM Toolkit — the libraries you'll actually use

Five libraries carry the whole course. Here's what each does and the handful of moves you need, ending with a complete mini-analysis that ties them together.

### 5.1 NumPy — fast math on arrays
- `np.log`, `np.sqrt`, `np.exp` — element-wise math (log returns, annualising).
- `.mean()`, `.std()`, `.sum()` — summary statistics over an array.

```python
import numpy as np
prices = np.array([100, 102, 101, 105])
log_rets = np.log(prices[1:] / prices[:-1])   # daily log returns
print(log_rets.mean(), log_rets.std())
```

### 5.2 pandas — the workhorse for time series
pandas gives you the **DataFrame** (a table with labelled columns and a date index) and the **Series** (one column). About 80% of your work happens here.

| Move | What it does |
|---|---|
| `pd.read_csv(f, index_col=0, parse_dates=True)` | Load a saved price table with a date index |
| `df['SPY']` / `df[['SPY','AAPL']]` | Select one column (Series) / several (DataFrame) |
| `df.head()` / `df.tail(3)` | Peek at the first / last rows |
| `np.log(df / df.shift(1)).dropna()` | Daily log returns for every column at once |
| `.rolling(21).std()` | Rolling 21-day statistic (e.g. moving volatility) |
| `.corr()` / `.cov()` | Correlation / covariance matrix across columns |
| `.pct_change()` / `.cumprod()` | Simple returns / cumulative growth (drawdowns) |

### 5.3 matplotlib & seaborn — charts
matplotlib draws; seaborn makes a few statistical charts prettier (notably the correlation heatmap). A line chart and a histogram cover most needs.

```python
import matplotlib.pyplot as plt
rets['SPY'].plot(title='SPY daily returns')   # a line chart in one call
plt.show()
rets['SPY'].hist(bins=100)                    # a histogram of returns
plt.show()
```

### 5.4 scipy.stats — distributions and tests
- `stats.norm.pdf` / `.cdf` / `.ppf` — the normal distribution (used all through VaR).
- `.skew()`, `.kurtosis()`, `stats.jarque_bera(x)` — measure and test for fat tails.

### 5.5 yfinance — free market data
yfinance downloads real price history from Yahoo Finance. It occasionally rate-limits you (an error about too many requests) — which is exactly why we save a CSV snapshot and reuse it (Part 6).

```python
import yfinance as yf
data = yf.download(['SPY','AAPL'], start='2021-07-01', end='2026-07-01')
prices = data['Close']            # a DataFrame of closing prices
prices.to_csv('my_prices.csv')    # save a snapshot so you never re-download
```

> **WATCH OUT — yfinance end date is exclusive.** `end='2026-07-01'` gives you data up to and including 2026-06-30 — the end day itself is not included. A `YFRateLimitError` just means "wait a minute"; your cached CSV lets you keep working offline.

### 5.6 Putting it together — a complete mini risk analysis
Every idea above, in one runnable block: download prices, compute log returns, and report annualised return, annualised volatility, and the correlation between two assets.

```python
import numpy as np, pandas as pd, yfinance as yf

prices = yf.download(['SPY','AAPL'], start='2021-07-01', end='2026-07-01')['Close'].dropna()
rets = np.log(prices / prices.shift(1)).dropna()   # daily log returns

ann_return = rets.mean() * 252                      # annualised mean
ann_vol = rets.std() * np.sqrt(252)                 # annualised volatility
corr = rets['SPY'].corr(rets['AAPL'])               # correlation

print('Annualised return:\n', (ann_return * 100).round(1))
print('Annualised vol:\n', (ann_vol * 100).round(1))
print(f'SPY-AAPL correlation: {corr:.2f}')
```

> **TIP — If you understand this block, you can read every Session 1 notebook cell.** Download → log returns → annualise → summarise. The rest of the course adds new risk measures on top of exactly this skeleton.

---

## 6. Habits That Help Achieve a Good Grade

### 6.1 Reproducibility is graded
Pin your dates, download once, and save a CSV snapshot. Your report's numbers must match that saved file exactly.
- Pin an explicit start and end date; never rely on "today."
- Download once, save to CSV, then load from the CSV for all later runs.
- If your narrative says 18% but the notebook says 19%, you lose marks — keep them in sync.

### 6.2 Know which returns you used - the exam wants you to say which one you used 

**Log returns** `r = ln(Pt/Pt-1)` add up neatly over time and are what we use for **risk statistics**
- log returns "add up neatly over time" — you can sum daily log returns to get the return over a week or month
- log_rets = np.log(prices / prices.shift(1)).dropna()   # ln(P_t / P_t-1)

**Simple returns** `(Pt/Pt-1 - 1)` are the **actual profit/loss**. State which you used — it's a common place to lose marks
- actual profit/loss (money you literally made)
- Intuitive, and what you'd report as "I earned 10%"
- simple_rets = prices.pct_change().dropna()   # (P_t / P_t-1) - 1



### 6.3 Use AI well
- **Great for:** boilerplate, plotting, reshaping data, and explaining an error you paste in.
- **Do not trust it for:** the sign of a VaR, annualisation factors, log-vs-simple returns, or a formula from the notes — verify against the definition.
- **Always understand what you submit.** AI is allowed on assignments, but you are responsible for every number and must be able to explain it.

### 6.4 When things break — quick fixes

| Symptom | Fix |
|---|---|
| Red "ModuleNotFoundError" | `pip install <name>` |
| Results look wrong / inconsistent | Kernel → Restart & Run All (re-run top to bottom) |
| "NameError: X is not defined" | You skipped the cell that defines X — run it first |
| yfinance won't download | Wait a minute, or load your saved CSV snapshot |
| Notebook won't run at all | Wrong kernel — pick the Anaconda interpreter (Part 0.4) |

---

## Appendix — One-Page Cheat Sheet

### Keyboard

| Action | Shortcut |
|---|---|
| Run cell / run and advance | Ctrl+Enter / Shift+Enter |
| Command Palette | Cmd/Ctrl+Shift+P |
| Open Copilot Chat | Ctrl+Alt+I |
| Copilot: accept a suggestion | Tab |
| Add cell above / below (press Esc first) | A / B |
| Restart everything cleanly | Kernel → Restart & Run All |

### Libraries at a glance

| Library | You use it for |
|---|---|
| numpy (np) | array maths: `np.log`, `np.sqrt`, `.mean()`, `.std()` |
| pandas (pd) | tables & time series: `read_csv`, columns, `.rolling()`, `.corr()` |
| matplotlib (plt) | charts: `.plot()`, `.hist()`, `plt.show()` |
| seaborn (sns) | prettier statistical charts (correlation heatmap) |
| scipy.stats | distributions & tests: `norm`, `skew`, `kurtosis`, `jarque_bera` |
| yfinance (yf) | download real market prices (then snapshot to CSV) |