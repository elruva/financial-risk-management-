# Instructions
# Measure the market risk of a portfolio of your three assigned stocks using three years of daily data,
# covering volatility, correlation, beta, Value-at-Risk (parametric, historical, and Monte Carlo),
# Expected Shortfall, a GARCH(1,1) volatility model,
# and a Basel-zone VaR backtest. Submit a single Jupyter notebook with your code,
# visualizations, and narrative analysis (max 10,000 characters); full details are in the assignment file.


# Required tasks:
# 1) Fetch three years of daily prices for your three stocks and your bloc's benchmark index.
#    Compute returns, then inspect and handle any data-quality issues such as missing days and
#    outliers, documenting what you cleaned.
# 2) Report each stock's annualized volatility and the correlation matrix, and comment on how
#    much diversification your three names actually provide.
# 3) Estimate each stock's beta to your bloc's index (S&P 500 for North America, STOXX Europe
#    600 for Europe) and discuss systematic versus idiosyncratic risk. Test your own returns for
#    the empirical regularities that any market-risk model must contend with - heavy tails (excess
#    kurtosis) and volatility clustering.
# 4) Implement the 1-day 99% VaR by three methods (parametric variance-covariance, historical
#    simulation, and Monte Carlo). Report how far the methods disagree for your portfolio and
#    use that spread to argue how objective a single reported VaR number really is.
# 5) Compute Expected Shortfall alongside each VaR. Discuss what ES tells you about the tail
#    beyond VaR, and test whether VaR is ever super-additive across your three names (so that
#    the portfolio VaR exceeds the sum of the individual VaRs), which would show VaR failing
#    to reward diversification.
# 6) Time-varying volatility: fit a GARCH(1,1) to one stock's returns. Report the parameters and
#    the volatility persistence (alpha plus beta), produce a one-day-ahead conditional-volatility
#    forecast, and compute a GARCH-based VaR. Contrast it with your constant-volatility VaR.
# 7) Backtest one VaR estimate over a rolling window: count the exceptions against the number
#    expected at 99%, place the result in the Basel traffic-light zones, and interpret it.
# 8) Discuss assumptions, strengths, limitations, and real-world implications for your companies,
#    framing it with the broader role of risk management.
