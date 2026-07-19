# Assignment 2: Credit, Derivative, Liquidity, and Operational Risk
#
# Due: Friday, July 17, 2026 @ 23:59
#
# Objective: Model the other major risks facing your three companies, namely
# credit risk (default and portfolio loss), derivative and option risk,
# liquidity risk, and operational risk.
#
# ## Required tasks
#
# ### 1) Merton structural model & PD
#
# Fetch each company's market cap (equity value E) and total debt (debt face D).
# Using E, D, and your Assignment 1 equity volatility, apply the Merton
# structural model to compute each firm's distance-to-default and PD = N(-DD).
# Explain the model and any approximation you use, and set each firm's result
# against its agency rating or credit spread. [^1]
#
# ### 2) Loan book & Monte Carlo portfolio loss
#
# Build a small loan book exposed to the three firms (e.g. EAD proportional to
# each firm's debt, LGD = 45%), compute the expected loss, then run a Monte
# Carlo simulation of portfolio loss with a single-factor (Gaussian-copula)
# default correlation. Report the loss distribution, Credit VaR (at 99% and
# 99.9%) and Expected Shortfall, and show how economic capital responds as you
# vary the asset correlation (say 0.05, 0.15 and 0.30). Discuss how this single
# Gaussian-copula factor can understate the chance of many firms defaulting
# together in a crisis, and relate your simulated loss distribution to the
# analytic single-factor formula that sits behind the Basel capital charge.
#
# ### 3) Derivatives
#
# Price a 3-month at-the-money option on Stock 1 (using its own volatility) by
# Black-Scholes and by a binomial tree, and check that the two converge. Report
# the Greeks (delta, gamma, vega), then compute the option-position VaR by a
# delta-gamma approximation and by full revaluation, and explain why a
# delta-only VaR misstates the risk and how that flips for a short position.
#
# ### 4) Liquidity-adjusted VaR
#
# Compute a liquidity-adjusted VaR by adding a liquidity cost to your
# Assignment-1 VaR, using a bid-ask spread or an illiquidity measure built from
# your own price and volume data (for example, average absolute return per unit
# of dollar volume). Compare the liquid and liquidity-adjusted figures and say
# which of your names is least liquid and why that matters in a sell-off.
#
# ### 5) Operational-loss distribution
#
# Simulate an operational-loss distribution with a Poisson loss frequency and a
# lognormal severity (justify your parameters), report a 99.9% operational-loss
# or capital figure, and discuss a real operational-risk event relevant to one
# of your firms or its sector.
#
# ### 6) Basel discussion
#
# Discuss how Basel treats credit, market, and operational risk (expected versus
# unexpected loss, the role of correlation, the standardized and model-based
# approaches) and the limitations of each model for your firms.
#
# ## Deliverable
# [^1]: Expect tiny Merton PDs and use that: for healthy large-cap firms the
#   structural 1-year PD is often almost zero. That is a real, reportable
#   finding, so discuss why it happens (low leverage, and the model's thin
#   Normal tail). To keep the loss simulation from being degenerate, floor your
#   PDs with a rating- or CDS-based mapping. For example, map each firm to an
#   agency rating and its historical 1-year default rate, or use a CDS-implied
#   PD, then run the Monte Carlo on those. Comparing the structural PD with the
#   market or rating-based PD is itself a key insight.
