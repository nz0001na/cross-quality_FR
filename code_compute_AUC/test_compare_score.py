import csv
from scipy import spatial
import numpy as np
# import norm

samples_path = 'F:/zn1/znMCM/MsCeleb1M_code/0code_human_recognition/code_human_exp_tool/EXP_V3/'
result_folder = samples_path + 'facescrub_samples_check/'
qry_feature = []
trg_feature = []
t = csv.reader(open(result_folder + 'qry_feature.csv'))
for row in t:
    qry_feature.append(row)
t = csv.reader(open(result_folder + 'trg_feature.csv'))
for row in t:
    trg_feature.append(row)

result_score = []
len_list = len(qry_feature)
for i in range(0, len_list):
    f1 = qry_feature[i]
    f2 = trg_feature[i]
    f1 = np.array(f1, dtype=float)
    f2 = np.array(f2, dtype=float)
    d = spatial.distance.cosine(f1, f2)
    result = 1 - d
    item = [str(i+1), str(result)]
    result_score.append(item)

t = csv.writer(open(result_folder + 'cosine_score.csv', 'wb'))
t.writerows(result_score)

print 'done'