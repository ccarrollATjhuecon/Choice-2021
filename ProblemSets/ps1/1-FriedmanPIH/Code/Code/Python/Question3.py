# ---
# jupyter:
#   jupytext:
#     formats: ipynb,py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.2'
#       jupytext_version: 1.2.4
#   kernelspec:
#     display_name: Python 3
#     language: python
#     name: python3
# ---

# %% [markdown]
# # Question 3: savings of black and white households
#
# The following cell simulates the situation described by the question

# %%
import numpy as np
import matplotlib.pyplot as plt

# Numer of household sin each group
n = 50

# Permanent incomes (white > black, but homogeneous)
p_w = 4
p_b = 3

# Transitory income shocks of similar size, and large
sigma_trans = 0.8
t_w = np.random.normal(0, sigma_trans, n)
t_b = np.random.normal(0, sigma_trans, n)

# Total incomes
y_w, y_b = p_w + t_w, p_b + t_b

# Consumption
c_w, c_b = p_w, p_b

# Saving rates
sr_w = (y_w - c_w)/y_w
sr_b = (y_b - c_b)/y_b

# Plot saving rates as a function of income
fig = plt.figure()
plt.plot(y_w, sr_w, '*r', label = 'White')
plt.plot(y_b, sr_b, '*b', label = 'Black')
plt.legend()
plt.grid()
plt.xlabel('Total income')
plt.ylabel('Saving rate')

# Export the plot
figname = 'BlackWhiteSavingRates'
fig.savefig(figname+'.svg')
fig.savefig(figname+'.png')
fig.savefig(figname+'.pdf')
