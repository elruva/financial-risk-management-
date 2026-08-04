# Assignment 3: Portfolio Optimization, Stress Testing, and Systemic Risk
#
# Due: Wednesday, July 22, 2026 @ 23:59
#
# Objective: Build optimal and robust portfolios from your three stocks, stress
# test them, and place them in a system-wide risk context.
#
# ## Required tasks
#
# ### 1) Efficient frontier & risk parity
#
# From your three stocks' mean returns and covariance, trace the mean-variance
# efficient frontier, mark and report the minimum-variance and the tangency
# (maximum-Sharpe) portfolios, and plot it. Also report the
# equal-risk-contribution (risk-parity) portfolio and each asset's risk
# contribution, and compare all of these with the equal-weighted portfolio.
#
# ### 2) Black-Litterman
#
# Start from the market-implied equilibrium returns, which you reverse-optimize
# from your stocks' market-cap weights (reuse the market caps from Assignment 2)
# and your covariance. Encode two views (one relative and one absolute) and how
# confident you are in each, derive the Black-Litterman weights, compare them
# with the plain mean-variance weights, and explain why anchoring to equilibrium
# gives steadier and more intuitive allocations.
#
# ### 3) Robust portfolio under estimation error
#
# Build a robust portfolio that allows for estimation error, for example a
# shrinkage-covariance minimum-variance portfolio or a resampled allocation.
# Explain why the tangency portfolio built from historical means swings so
# wildly with small changes in the inputs, and how risk parity and robust
# methods correct that instability.
#
# ### 4) ESG tilt
#
# Apply an ESG tilt or constraint to your portfolio and quantify its risk-return
# cost or benefit. Use real ESG or sustainability scores if you can source them,
# otherwise assign documented proxy scores and state where they came from. Where
# you can, take scores from two different providers or proxies and show how the
# disagreement between them changes which names your ESG portfolio favours.
#
# ### 5) Scenario stress testing
#
# Construct at least three plausible scenarios from macro-financial or
# ESG/climate risk factors, justified for your specific companies and sectors.
# Map each scenario to per-stock shocks, quantify the impact on portfolio value
# and on VaR and ES, compare the stress losses with your normal-times VaR, and
# add a historical stress window sliced from your own data. Judge whether your
# scenarios capture the kind of system-wide, correlated stress that
# macroprudential regulation is concerned with.
#
# ### 6) Systemic risk & contagion
#
# Compute a systemic-risk measure for one of your stocks against the market, for
# example a CoVaR or delta-CoVaR, or analyze how the correlations among your
# names spike in a crisis window (contagion), so that diversification fades
# exactly when it is most needed. Discuss the model risk running through your
# whole exercise and where your models would be most likely to fail.
#
# ### 7) Resilience, out-of-sample test & recommendation
#
# Run your scenarios on every candidate portfolio (equal-weight,
# minimum-variance, tangency, Black-Litterman, risk-parity, robust and
# ESG-constrained) and show which construction is most resilient. Then, using an
# out-of-sample split (estimate the weights on an earlier window and evaluate
# them on a later one), test whether any of your optimized portfolios actually
# beats the naive equal-weight (1/N) portfolio out of sample, as in DeMiguel,
# Garlappi and Uppal (2009). Make a final recommendation for your investor and
# assess the whole exercise against regulatory stress-testing frameworks
# (Basel III) and risk governance.
#
# ## Deliverable
#
# Jupyter section: optimization and scenario code, quantitative results, risk
# implications, commentary. <= 10,000 chars.
