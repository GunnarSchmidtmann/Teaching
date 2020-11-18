#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 30 10:50:30 2020

@author: gunnarschmidtmann
"""

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import seaborn as sns
from scipy.stats import norm

plt.close('all')


df = pd.read_csv('Data/shoe_size1.csv', usecols=['Sex','Shoe Size.1'])


male = df.loc[df['Sex'] == 1]
female = df.loc[df['Sex'] == 2]


fig, (plt1, plt2, plt3) = plt.subplots(nrows=3, ncols=1)

plt1.plot(male['Shoe Size.1'],'og',label='male')

plt1.plot(female['Shoe Size.1'],'or',label='female')
plt1.legend()
plt1.grid()

# stats
mean_male, std_male=norm.fit(male['Shoe Size.1'])
mean_female, std_female=norm.fit(female['Shoe Size.1'])



plt2.hist(male['Shoe Size.1'],color = "g",normed=True,bins=10, alpha=0.5, label="male")
plt2.hist(female['Shoe Size.1'],color = "r",normed=True, bins=10, alpha=0.5, label="female")
plt2.invert_xaxis()


# Plot the PDF.
sns.set_color_codes()
sns.distplot(male['Shoe Size.1'],fit=norm,bins=9,kde=False,color='g')
sns.distplot(female['Shoe Size.1'],fit=norm,bins=9,kde=False,color='r')




