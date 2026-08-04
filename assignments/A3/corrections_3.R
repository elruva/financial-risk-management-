# Financial Risk Management and Engineering
#
# Assignment 3: General Feedback
#
# Portfolio optimization, stress testing and systemic risk on your three
# companies. This is feedback for the whole class and names no one. As in
# Assignment 2, the required methods were implemented in almost every notebook,
# so this note does not repeat what worked. It lists the deficiencies that cost
# marks and the concrete fix for each, ordered by how much they affect the
# grade. One difference this time: the single most common problem is no longer a
# method error, it is length. Most write-ups are well over the character limit.
#
#   two thirds      of the write-ups run past the 10,000-character narrative
#                   limit, several by three to eight times, usually because
#                   unedited model output was pasted in rather than a short
#                   interpretation written
#   about half      compared the optimized portfolios against naive 1/N out of
#                   sample but did not report turnover or say why 1/N is hard to
#                   beat, so the DeMiguel comparison was run but not interpreted
#   a few           cannot be reproduced from the file: execution counts were
#                   cleared or the cells were run out of order, so a clean
#                   top-to-bottom run cannot be confirmed
#
# ## Most common issue: the write-up is far over the character limit
#
# The brief sets a hard limit of 10,000 characters of narrative per assignment.
# Two thirds of submissions are over it. The median write-up is close to 13,000
# characters, six are past 20,000, and the longest is near 80,000, roughly eight
# times the limit. In almost every long submission the extra length is not extra
# analysis. It is unedited model output: a full paragraph restating what an
# efficient frontier is, a method described again in words after the code
# already did it, or the same result narrated twice.
#
# The limit is part of the task, not a formatting note. It rewards the skill
# this assignment is really testing, which is reading your own numbers and
# saying what they mean in a few sentences. A good result section is one to
# three sentences: the number, what it says about the portfolio, and the
# decision it drives. Concrete step: before you submit, count the characters in
# your markdown cells (not the code, not the figures) and cut to the limit. If a
# paragraph restates a definition or repeats a number already shown in a table,
# delete it. What survives that cut is your actual analysis.
#
# ## Priorities to improve
#
# Ordered by how much they affect the grade, now that almost every submission
# completes all of the required tasks.
#
# 1) Cut the write-up to the character limit, and make every sentence carry a
#    result  [highest value]
#    This was the most common way a strong notebook lost marks it had already
#    earned. When the analysis is buried in three times too much text, the
#    reader cannot find the one sentence that shows you understood the result,
#    and the parts that restate definitions or repeat a table read as padding.
#    The character limit is there to force the edit.
#
#    Concrete steps: (1) Count the characters in your markdown cells only. (2)
#    Delete any paragraph that defines a method the code already implements, or
#    that narrates a number already printed in a table. (3) For each result,
#    keep one to three sentences: the number, what it means for the portfolio,
#    and the decision it supports. (4) If you used a model to draft the text,
#    this edit is the step that turns its output into your analysis. The length
#    limit is where an unedited paste loses marks and a tight interpretation
#    gains them.
#
# 2) Interpret the 1/N comparison, do not just run it  [fix]
#    Every notebook compared the optimized portfolios against the naive 1/N
#    portfolio out of sample, which is what the DeMiguel, Garlappi and Uppal
#    (2009) task asks for. Fewer explained the result. The point of that paper
#    is not that 1/N wins, it is why it is so hard to beat: the optimized
#    weights depend on estimated means and covariances, and the estimation error
#    in those inputs often costs more than the optimization gains. A notebook
#    that reports 1/N did better or worse out of sample, without saying that
#    estimation error and turnover are the reason, has run the test but not
#    answered it.
#
#    Concrete steps: (1) Report the out-of-sample Sharpe of each optimized
#    portfolio next to 1/N. (2) Report turnover, the sum of absolute weight
#    changes at each rebalance, for each strategy. Only about half of you did
#    this, and it is the mechanism the paper is about: the optimized portfolios
#    trade far more, and after costs that erodes the edge. (3) State in one or
#    two sentences whether your results match the paper and why.
#
#    # turnover is the mechanism DeMiguel et al are pointing at: report it next to the OOS Sharpe
#    turnover = np.abs(w_new - w_prev).sum()   # per rebalance, per strategy
#    # optimized portfolios trade far more than 1/N; after costs that is why 1/N is hard to beat
#
# 3) Make the notebook reproducible, then match your text to it  [fix]
#    The same reproducibility problem from Assignment 2 is still here, in a few
#    notebooks. Some were saved with the execution counts cleared, so there is
#    no evidence the cells ran top to bottom in one pass. At least one ran out of
#    order. When the counts are gone or out of sequence, the printed numbers
#    cannot be confirmed as coming from a single clean run, and any text figure
#    that no longer matches a table is impossible to tell apart from a bug.
#
#    Concrete steps: (1) Restart the kernel and Run All as the last step before
#    saving, so the execution counts are 1, 2, 3 in order and every output is
#    from that run. (2) Re-read each discussion cell against the numbers printed
#    above it. (3) Confirm that every number in the text matches a specific cell
#    output from that run. The PDF export you submit should show the same
#    in-order counts.
#
# 4) Take the stress test one step further: re-optimize under the stressed
#    inputs  [depth]
#    Most of you did the assigned task well: you applied the scenarios to every
#    candidate portfolio and compared their stressed losses to pick the most
#    resilient. That is exactly what "re-stress all candidates and recommend"
#    asks for, and it was a strength of this set. The step that separates a
#    strong submission is to also feed the stressed inputs back into the
#    optimizer, so you can say not just which fixed portfolio holds up best, but
#    whether the recommended weights would themselves change under stress. About
#    a third of notebooks stopped at the fixed-weight comparison.
#
#    Concrete steps: (1) Build the stressed covariance and stressed expected
#    returns. (2) Re-run the minimum-variance, tangency, risk-parity and
#    Black-Litterman weights on those stressed inputs. (3) Report how far the
#    stressed-optimal weights move from the base case. A portfolio whose optimal
#    weights barely change under stress is more robust than one that flips, and
#    showing that adds a reason to your recommendation that the fixed-weight loss
#    comparison cannot give on its own.
#
#    # beyond comparing fixed candidates: RE-OPTIMIZE on stressed inputs and see if the choice moves
#    mu_stx  = mu - beta * shock          # shocked expected returns
#    cov_stx = cov * corr_blowup_factor   # crisis covariance (higher vol, higher corr)
#    w_stx   = min_variance(cov_stx)      # same optimiser, stressed inputs
#    print((w_stx - w_base).abs().sum())  # how far the recommended weights move
#
# 5) Comment on extreme or unstable optimized weights  [depth]
#    With only three stocks, the unconstrained tangency portfolio and the
#    Black-Litterman weights often come out extreme: a large long in one name
#    funded by a short in another, or a weight over 100 percent. Strong
#    submissions flagged this and used it as the reason robust covariance,
#    Black-Litterman and risk parity exist. Average ones printed the extreme
#    weights and moved on, which leaves the reader unsure whether it is a result
#    or a bug.
#
#    Concrete steps: (1) When a weight is extreme, say so and say why: the
#    tangency portfolio is very sensitive to small changes in the estimated
#    means. (2) Show the fix working: shrinkage covariance, a long-only
#    constraint, or the Black-Litterman posterior should all pull the weights
#    back toward something investable. (3) Report the before and after so the
#    reader can see the instability and the correction, not just the final
#    number.
#
# 6) Report the systemic increment for CoVaR, not just a level  [depth]
#    Most notebooks estimated CoVaR by quantile regression, which is the right
#    method. The common gap is in what gets reported. CoVaR on its own is a
#    level; the systemic contribution is delta-CoVaR, the difference between the
#    system's VaR when a firm is in distress and when it is at its median state.
#    A few notebooks reported the stressed-state CoVaR as if it were the systemic
#    contribution, which overstates it, because part of that level is just normal
#    co-movement.
#
#    Concrete steps: (1) Compute CoVaR at both the distress quantile and the
#    median state of the conditioning firm. (2) Report delta-CoVaR as the
#    difference. (3) Say which of your three stocks contributes most to system
#    risk and by how much, and connect it to the portfolio: an asset that is a
#    large systemic contributor is a reason to cap its weight, which ties the
#    systemic section back to the optimization.
#
# 7) Smaller points that affect the grade  [watch]
#    Justify the Black-Litterman views, do not just insert one. Several notebooks
#    kept an illustrative view from the template, or invented a view with no
#    stated basis. State where the view comes from and how confident you are in
#    it, because the confidence (the omega matrix) is what drives how far the
#    posterior moves from equilibrium.
#    Size the ESG tilt. Many notebooks applied an ESG constraint or tilt and then
#    did not report what it cost. Show the return and risk of the portfolio with
#    and without the ESG tilt, so the trade-off is a number, not just a statement
#    that you included ESG.
#    State the risk-free rate and where it came from. The Sharpe ratio and the
#    tangency portfolio both depend on it. A few notebooks left it implicit or
#    used zero without saying so.
#    Keep annualization consistent. Mixing daily and annual figures, or using
#    252 in one place and 250 in another, produces Sharpe ratios and volatilities
#    that do not line up across sections. Set the convention once and reuse it.
#    State when a live pull falls back to a hardcoded value. As in Assignment 2,
#    when a market cap, an ESG score or a price download fails and you substitute
#    a hand-entered figure, add a printed note so the reader can tell which
#    values were fetched and which were entered by hand.
