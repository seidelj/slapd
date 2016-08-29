import os
import pandas as pd
#import matplotlib.pyplot as pl
import statsmodels.api as sm

ROOT = os.path.dirname(os.path.abspath(__file__))
DATA = os.path.join(ROOT, 'nls')
csvFile = os.path.join(ROOT, 'main.csv')


df = pd.read_csv(csvFile, index_col=12)
print df.describe()

#print pd.crosstab(df['hs'], df['trt'], rownames=['graduated hs'])

#df.hist()
#pl.show()

dummy_gender = pd.get_dummies(df['gender'], prefix="gender")
print dummy_gender.head()

dummy_race = pd.get_dummies(df['race'], prefix="race")
print dummy_race.head()

cols_to_keep = ['edu', 'trt', 'pov_youth']
data = df[cols_to_keep].join(dummy_gender.ix[:, 'gender_2':])
data = data.join(dummy_race.ix[:, 'race_2':])

data = sm.add_constant(data, prepend=False)

independent_vars = data.columns[1:]
edu_ols = sm.OLS(data['edu'], data[independent_vars], missing='drop')
edu_result = edu_ols.fit()

print edu_result.summary()

#df = df[(df.S1240800 == 1) | (df.S1240801 == 1)]



# T4581000 T6213300 T7710700 T9112700 cause of biomothers death
# T4580600 T6212900 T7710300 T9112300 cause of biofathers death

#print df[(df.T4581000 == 2) | (df.T4580600 == 2) | (df.T6213300 == 2) | (df.T6213300 == 2) | (df.T6212900 == 2) | (df.T7710700 == 2) | (df.T7710300 == 2) | (df.T9112700 == 2) | (df.T9112700 == 2)]
