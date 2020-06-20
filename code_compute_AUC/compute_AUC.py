import os
import csv
import numpy as np
from sklearn import metrics

# positive
result_path = 'D:/zn_Projects/human_exp/result_analysis/EXP_V3_VGG/result/4 jm/'
list = os.walk(result_path).next()[1]
length = len(list)

for n in range(0, length):
    name = list[n]
    far_path = result_path + name + '/FAR.csv'
    t = csv.reader(open(far_path))
    far = []
    for row in t:
        far.append(row)

    gar_path = result_path + name + '/GAR.csv'
    t = csv.reader(open(gar_path))
    gar = []
    for row in t:
        gar.append(row)

    x = np.array([0,0.25253,0.25253,1,1])
    y = np.array([0,0.60204,0.60204,1,1])

    fpr, tpr, thresholds = metrics.roc_curve(x, y, pos_label=2)
    re = metrics.auc(fpr, tpr)




    print re