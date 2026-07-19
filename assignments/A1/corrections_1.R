# Financial Risk Management and Engineering
#
# Assignment 1: General Feedback
#
# Market risk: volatility, VaR and Expected Shortfall. This is feedback for the
# whole class and names no one. You built on the Session 2 to 4 notebooks, and
# most of you rebuilt that code for your own three stocks and index, which is
# what the assignment asked. Getting the mechanics right is the starting point,
# not the goal. This note is about the next step: turning a correct run of the
# template into analysis that is your own, which is the standard the final
# portfolio will be graded on.
#
#   almost all  core mechanics (log returns, sqrt(252), w'Sigma w, norm.ppf,
#               GARCH, Kupiec/Basel) were present and mostly correct, but that
#               code was provided
#   ~1 in 4     notebooks were not run in order top to bottom (out-of-order
#               cells, stale or empty outputs)
#   a few       reported impossible numbers without noticing them
#   most        Monte Carlo runs drew from a normal, so they only repeated the
#               parametric VaR
#
# ## What stood out - aim for this
#
# - A variance-matched Student-t Monte Carlo (scaled by sqrt((nu-2)/nu)), with a
#   note that a normal Monte Carlo only repeats the parametric VaR.
# - The GARCH stock chosen by a Ljung-Box or ARCH-LM test for clustering, then
#   the fit checked with standardized residuals, a half-life, or a normal-vs-t
#   AIC comparison.
# - A Yellow or Red Basel zone reported as computed, with a note that the
#   breaches cluster in time, rather than the model adjusted to reach Green.
# - A median/MAD z-score for outliers, with each flagged day named (for example,
#   the April 2025 tariff selloff).
# - Super-additivity checked across several confidence levels or rolling
#   windows, with the sub-additive result explained by low correlation in the
#   sample, not a property of VaR.
# - Hand-coded Jarque-Bera, Ljung-Box, or a GARCH optimizer; an explanation of
#   EWMA-vs-GARCH ghosting; the note that clustering in one stock fades at the
#   portfolio level; the third stock chosen by lowest correlation.
#
# ## The habit that cost the most: trusting a number you did not check
#
# Several notebooks reported figures that are impossible and moved straight on:
# a portfolio VaR of $228 on a $1M book (a decimal read as a percent, a 100x
# error); a GARCH persistence of exactly 1.000 giving an 18% one-day VaR, called
# "high persistence" instead of flagged as an unstable boundary fit; a stock
# beta of 0.02; an excess kurtosis of 77 caused by a single day.
#
# A number that fails a plausibility check is something to investigate, not
# something to report. Before you write about any result, ask whether its size
# is even possible. In a risk job, this check is the work. Build one habit: look
# at every headline number and ask "could this be real?" - it would have caught
# every one of these.
#
# ## Priorities to improve
#
# Ordered by how much they separate a strong submission from an average one, now
# that the mechanics are expected.
#
# 1) Check every headline number  [highest value]
#    See the box above. The worst errors were not wrong methods. They were
#    correct-looking code whose output was nonsense, reported without question.
#    Keep a rough range in mind for each quantity: a daily 99% equity VaR is low
#    single-digit percent, annualized vol is 15 to 60 percent, a single-stock
#    beta is about 0.3 to 2, and GARCH persistence is below 1 (a value stuck at
#    1.000 means the fit hit a boundary). When a number falls outside its range,
#    that is the part worth digging into - explain it or fix it.
#
# 2) Make Monte Carlo a different method  [fix]
#    The most common conceptual gap. A normal Monte Carlo draws from the same
#    distribution the parametric method assumes, so the two match by design and
#    your "three methods" become two. Almost everyone did this; few noticed it.
#    Give MC something the parametric method does not have - fat-tailed
#    (Student-t) draws or a bootstrap of your own returns - with the variance
#    matched so the comparison is fair. Then say why a normal MC would have
#    added nothing. That one sentence is worth more than the whole simulation.
#
#    # variance-matched t, so only the tail shape differs from parametric
#    nu    = 5
#    scale = sigma * np.sqrt((nu-2)/nu)
#    sims  = mu + scale * rng.standard_t(nu, size=200_000)
#    VaR   = -np.quantile(sims, 0.01)
#
# 3) Read your GARCH output - do not just print it  [fix]
#    GARCH was where reused code and real understanding split most. The same
#    arch recipe appeared everywhere; what differed was whether the student
#    understood the output. Three things separate a real GARCH analysis from a
#    printed one: choose the stock because your own tests found clustering in it
#    (not because it is the most volatile); handle the edge case - if
#    persistence (alpha + beta) is at or above 1, the long-run variance is
#    undefined, and that is a result, not a footnote to skip; and check that the
#    parameters are significant before you interpret them.
#
#    persist = a1 + b1
#    if persist < 1:
#        long_run = omega/(1-persist); half_life = np.log(0.5)/np.log(persist)
#    else:
#        print("Persistence >= 1: near-integrated fit, long-run vol undefined")
#
# 4) Look past the Basel count  [depth]
#    Almost every backtest came out Green - not because the models are good, but
#    because the last 250 days were calm. The exception count on its own set no
#    one apart. What matters is what you say past the count: do the breaches
#    cluster in time (a slow-reacting model), does the full sample hide a Yellow
#    or Red year behind the calm recent window, what does a Kupiec test say, and
#    how little power you have at 99% (about 2.5 breaches expected a year). The
#    traffic-light thresholds are set for 250 observations, so do not read a
#    zone off a 500-day count.
#
# 5) Restart and Run All before you submit  [fix]
#    About a quarter of notebooks were not run in order top to bottom - cells
#    run out of order, cells showing output with no execution count (old results
#    from code that has since changed), and a few with pip-install cells or
#    error tracebacks left in. One notebook was barely run at all, so its whole
#    write-up used "expected" wording ("beta is expected to be above 1") because
#    there were no numbers. Restart the kernel and run all cells as your last
#    step. It catches hidden-state bugs, undefined variables, and old numbers.
#    The rule that follows: if your text gives a number, that number must show
#    up in a cell output. Numbers that appear only in the text and nowhere in
#    the outputs were a repeated problem, always in the notebooks that were not
#    run in order.
#
# 6) Write interpretation that is yours, tied to your numbers  [depth]
#    The line that "a single VaR is a modelling choice, not an objective fact"
#    appeared in almost every notebook in nearly the same words. It is correct -
#    but it is the template's wording, so on its own it sets no one apart. Make
#    the point with your spread ("my three methods ranged from X to Y percent, a
#    Z percent gap"), your companies, and your events. Replace any
#    template-shaped "if" sentence ("if the exceptions exceed the threshold the
#    model is rejected") with the result you actually got. The interpretation is
#    where the marks are, because the code was provided.
#
# 7) Smaller things worth the marks  [watch]
#    Keep exposures consistent in the super-additivity test. Compare each name's
#    VaR at its portfolio weight against the weighted portfolio VaR - not
#    full-position individual VaRs against a one-third-weighted portfolio.
#    Build the portfolio series in simple returns. Log returns do not add up
#    across assets, so a weighted sum of log returns puts a small error into the
#    portfolio P&L. Use simple returns for the portfolio series and log returns
#    for single-asset models.
#    Match the benchmark to your region (S&P 500 or STOXX Europe 600). If you
#    convert prices to a common currency, convert the stocks and the index the
#    same way - converting only the index adds FX noise to the benchmark and
#    throws off your betas.
#    Fix the data and set the seed. A "download the last 3 years to today" pull
#    changes every run, so save a dated CSV snapshot and load from that, and
#    seed every simulation. This matters for the portfolio, which has to
#    reproduce months from now.
#
# ## Quick reference, task by task
#
#   Task                     Where the marks are now         Common shortfall
#   1. Data & cleaning       MAD outlier screen; each        +/-3s flags normal
#                            flagged day named; fixed        days; +/-25% flags
#                            snapshot                        none; live pulls
#   2. Vol & correlation     Diversification measured and    Reporting the matrix
#                            explained; rolling corr for     without a
#                            stress                          diversification read
#   3. Beta & stylized       Per-name results - clustering   Blanket "fat tails
#      facts                 differs; ACF of returns vs      and clustering"; a
#                            squared plus a test             lone lag-1 autocorr
#   4. Three VaR methods     MC made fat-tailed or           Normal MC passed off
#                            bootstrapped; spread explained  as a separate method
#   5. ES & super-additivity Weight-consistent comparison;   A single
#                            stress across levels/windows    sub-additive check
#   6. GARCH(1,1)            Stock chosen by clustering;     Degenerate IGARCH
#                            fit checked; persistence~1      fit reported as a
#                            handled                         real 18% VaR
#   7. Backtest & Basel      Breach timing, hidden non-Green Reading a Green off
#                            year, Kupiec, low power; zone   a calm window as
#                            on 250 obs                      proof
#   8. Discussion            Your spread, companies, events  Template's "VaR is
#                                                            not objective" line
#
# ## Before you resubmit - checklist
#
# [ ] Notebook restarts and Runs All top to bottom with no errors, no stale
#     cells, no leftover pip-installs.
# [ ] Every number in your text is visible in a cell output; every headline
#     figure passed a plausibility check.
# [ ] Monte Carlo uses a distribution the parametric method does not (t or
#     bootstrap), and you say why.
# [ ] The GARCH fit is checked, persistence is below 1 (or the boundary case is
#     flagged), parameters are significant.
# [ ] The Basel zone is read on 250 days, with breach timing and a Kupiec test,
#     not the count alone.
# [ ] Super-additivity compares weight-consistent VaRs; the portfolio series
#     uses simple returns.
# [ ] Data is a fixed, saved snapshot; every simulation is seeded; the benchmark
#     matches your region.
# [ ] Narrative is written in your own words around your own numbers.
