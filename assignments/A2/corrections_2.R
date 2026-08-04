# Financial Risk Management and Engineering
#
# Assignment 2: General Feedback
#
# Credit, derivative, liquidity and operational risk on your three companies.
# This is feedback for the whole class and names no one. The required methods
# were implemented correctly in almost every notebook, so this note does not
# repeat what worked. It lists the deficiencies that cost marks and the
# concrete fix for each, ordered by how much they affect the grade.
#
#   about a fifth   cannot be reproduced from the file: cells were run out of
#                   order, or execution counts were cleared, so a clean
#                   top-to-bottom run cannot be confirmed
#   several         write-ups quote a number that does not match the
#                   notebook's own output, usually text left over from an
#                   earlier run
#   most            stopped at the required Gaussian copula and did not test a
#                   fat-tailed or stressed-correlation factor, so the
#                   crisis-correlation discussion has no supporting number
#
# ## Most common issue: written numbers that do not match the code output
#
# Several write-ups quote a number that does not match the notebook's own
# output. One discussion cited a correlation sensitivity that differed from the
# table directly above it. Another cited an expected loss and a 99.9% VaR that
# differed from the tables computed earlier in the same notebook. In both cases
# the text was left over from an earlier draft or run.
#
# A related issue: an unchanged or negative number printed without comment.
# Several notebooks reported identical 99% and 99.9% credit VaR across every
# correlation value, or a negative economic capital, and did not comment on it.
# These results are correct: with only three obligors, the 99th percentile
# scenario is often zero defaults regardless of correlation. But they need to be
# explained, not just printed. Concrete step: before you submit, check that each
# number in the text matches a cell output, and explain any number that does not
# change when you expect it to.
#
# ## Priorities to improve
#
# Ordered by how much they affect the grade, now that almost every submission
# completes all six tasks correctly.
#
# 1) Make the notebook reproducible, then match your text to it
#    [highest value]
#    This was the most common way a strong notebook lost marks it had already
#    earned. About a fifth of submissions either ran out of order (execution
#    counts not in sequence) or were saved with the execution counts cleared, so
#    the printed numbers cannot be confirmed as coming from one run. In those
#    notebooks, text figures that no longer match the tables are the sign of it.
#
#    Concrete steps: (1) Restart the kernel and Run All as the last step before
#    saving, so the execution counts are in order (1, 2, 3, and so on) and every
#    output is from that run. (2) Re-read each discussion cell against the
#    numbers printed above it. (3) Confirm that every number in the text matches
#    a specific cell output from that run.
#
# 2) Explain an unchanged or negative credit-VaR result  [fix]
#    With only three obligors, 99% credit VaR is often exactly zero, and 99.9%
#    VaR often does not change across correlation values, because two or more
#    simultaneous defaults remain rare at any number of simulation paths. This
#    is a correct property of small, concentrated portfolios. Strong submissions
#    explained it; average ones printed it without comment.
#
#    Concrete step: compare your simulated economic capital with the analytic
#    single-factor (Vasicek / Basel ASRF) formula, which assumes a fully
#    diversified pool and therefore does change with correlation. The difference
#    between the three-name simulation and the analytic result answers the
#    question of how correlation drives economic capital. Show both, not just
#    the simulation.
#
#    # Vasicek / Basel single-factor capital, against the three-name Monte Carlo
#    from scipy.stats import norm
#    K = LGD * norm.cdf((norm.ppf(PD) + np.sqrt(rho)*norm.ppf(0.999)) /
#                       np.sqrt(1 - rho))
#    EC_analytic = K * EAD - LGD * PD * EAD   # unexpected loss = capital - EL
#
# 3) Test the copula assumption, do not just restate it  [depth]
#    Nearly every notebook wrote a version of "a single Gaussian factor
#    understates the chance of joint default in a crisis." The statement is
#    correct, but on its own it repeats the assignment wording and adds no
#    analysis.
#
#    Concrete step: run a second, fatter-tailed factor (a Student-t copula with
#    low degrees of freedom, or a stress case with a higher correlation) and
#    report the ratio by which the probability of two or more defaults rises.
#    Submissions that did this found the joint-default probability was
#    substantially higher under the fat-tailed factor at the same correlation.
#    That comparison earns the marks, not the sentence.
#
# 4) Make the liquidity adjustment large enough to compare  [fix]
#    In most notebooks the liquidity add-on was a fraction of a percent of the
#    base VaR, because a small position in a large-cap stock has little
#    liquidity cost. That makes the required comparison of liquid and
#    liquidity-adjusted VaR too small to see. A near-zero add-on also appeared
#    for a second reason: an Amihud illiquidity ratio (price impact per dollar
#    traded) used directly as a dollar cost, without first converting it to a
#    spread-equivalent, which makes the adjustment almost zero.
#
#    Concrete steps: (1) Check the units of your illiquidity measure before
#    multiplying it by position size. (2) Add a stressed-volume case (trading at
#    a lower fraction of normal volume) so the liquidity adjustment is large
#    enough to compare against the base VaR.
#
# 5) Justify operational-risk parameters, don't just assert them  [depth]
#    This task had the least data support, because firms do not publish their
#    internal loss history. Almost every notebook chose the Poisson frequency
#    and lognormal severity by judgment, often anchored to a single real event.
#    Few stated that the parameters were assumptions rather than fitted values.
#
#    Concrete steps: (1) State that the parameters are assumptions. (2) Add a
#    sensitivity table: change the lognormal sigma by a small amount and report
#    the change in the 99.9% capital figure. Several notebooks found a change of
#    an order of magnitude or more. Reporting that sensitivity is stronger than
#    presenting a single figure as if it were precise.
#
# 6) Check each result with a second, independent method  [depth]
#    Many notebooks ran a single calculation for a task and reported its number
#    with nothing to confirm it. A single Monte Carlo credit VaR, a single
#    binomial option price, or a single set of Greeks can carry a coding error
#    that is invisible without a second method to compare against.
#
#    Concrete steps: add one independent check per task. (1) Check the
#    credit-loss Monte Carlo against an exact Gauss-Hermite or numerical
#    integration of the loss distribution. (2) Check the binomial option price
#    against the closed-form Black-Scholes price. (3) Check analytic Greeks
#    against finite-difference estimates. Report both numbers and state that
#    they agree.
#
# 7) Smaller points that affect the grade  [watch]
#    Separate risk-neutral PD from physical PD. Several notebooks treated the
#    near-zero Merton (risk-neutral) PD and a rating- or spread-implied
#    (physical) PD as the same quantity. State which one you use where, and why
#    they differ.
#    Keep your stated LGD consistent. A few notebooks described one recovery
#    assumption in the text while the code used a different LGD. The numbers
#    were internally consistent, but the wording did not match, which reads as
#    an error.
#    State when a live data pull falls back to a hardcoded value. Several
#    notebooks substitute a hand-entered market cap, debt figure, or rating when
#    the live pull fails, without noting it. Add a comment or a printed warning
#    so the reader can tell which values were fetched and which were entered by
#    hand.
#    Sweep all three correlations. The credit task asks for the same set of
#    asset correlations throughout. A few notebooks report only two of the
#    three, or a different set in the table than in the text. Loop over the
#    exact set the brief lists and print one row per value.
#    Connect the Merton result to the credit portfolio. In a few notebooks the
#    rating-floor PD replaced the structural PD completely, so the Merton result
#    never fed the credit-portfolio simulation. If you floor the PD, state which
#    firms it applied to and why, so the Merton model is still part of the
#    result.
#
# ## Quick reference, task by task
#
#   Task                   Common deficiency          How to fix it
#
#   1. Merton PD           A near-zero PD reported    Compare the PD against
#                          alone, with no comparison  both a rating-implied and
#                          to a market or agency      a spread/CDS-implied PD,
#                          benchmark                  and explain the near-zero
#                                                     result as a diffusion,
#                                                     no-jump limitation
#
#   2. Credit portfolio    Unchanged VaR across the   Explain it as a
#                          three correlation values   granularity effect,
#                          reported without comment;  cross-check against the
#                          Monte Carlo used as the    analytic Vasicek/ASRF
#                          only check                 formula, and show
#                                                     correlation's effect via
#                                                     ES or the exact joint-
#                                                     default probability
#
#   3. Derivatives &       Only one pricing method,   Show a binomial-to-Black-
#      Greeks              or delta-gamma assumed     Scholes convergence
#                          close enough with no full  table, and report delta-
#                          revaluation check          only vs delta-gamma vs
#                                                     full-revaluation VaR for
#                                                     both long and short, with
#                                                     the reason for the sign
#                                                     change
#
#   4. Liquidity-adjusted  A near-zero add-on from an Compare two illiquidity
#      VaR                 unconverted price-impact   measures and explain the
#                          ratio, reported without    disagreement, and scale
#                          comment                    the add-on to a stressed
#                                                     volume so it is large
#                                                     enough to compare
#
#   5. Operational risk    Parameters presented as if State the parameters as
#                          fitted to data, with no    assumptions, add a
#                          sensitivity check          severity sensitivity
#                                                     table, and tie a real,
#                                                     dated event to a computed
#                                                     percentile
#
#   6. Basel discussion    General expected-loss and  Tie the discussion back
#                          unexpected-loss statements to your own computed PDs,
#                          with no numbers attached   VaRs and capital figures,
#                                                     firm by firm
#
