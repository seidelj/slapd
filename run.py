import os
import pandas as pd

ROOT = os.path.dirname(os.path.abspath(__file__))
DATA = os.path.join(ROOT, 'nls')
csvFile = os.path.join(DATA, 'dataset1DEATH.csv')


df = pd.read_csv(csvFile, index_col=0)
df = df[(df.S1240800 == 1) | (df.S1240801 == 1)]


# T4581000 T6213300 T7710700 T9112700 cause of biomothers death
# T4580600 T6212900 T7710300 T9112300 cause of biofathers death

print df[(df.T4581000 == 2) | (df.T4580600 == 2) | (df.T6213300 == 2) | (df.T6213300 == 2) | (df.T6212900 == 2) | (df.T7710700 == 2) | (df.T7710300 == 2) | (df.T9112700 == 2) | (df.T9112700 == 2)]
