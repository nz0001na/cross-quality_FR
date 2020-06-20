import csv

# read features of samples
# CenterLoss\0220_V2_LvsH      lightCNN/0126_V_LvsH/
src_path = 'F:/zn1/znMCM/MsCeleb1M_code/0code_verification_python/data_files/CenterLoss/0220_V2_LvsH/'
qry_feature = []
qry_names = []
t = csv.reader(open(src_path + 'qur_row_feature.csv'))
for row in t:
    qry_feature.append(row)
t = csv.reader(open(src_path + 'qur_row_name.csv'))
for row in t:
    qry_names.append(row[0])

trg_feature = []
trg_names = []
t = csv.reader(open(src_path + 'trg_col_feature.csv'))
for row in t:
    trg_feature.append(row)
t = csv.reader(open(src_path + 'trg_col_name.csv'))
for row in t:
    trg_names.append(row[0])

samples_path = 'F:/zn1/znMCM/MsCeleb1M_code/0code_human_recognition/code_human_exp_tool/EXP_V3/'
# facescrub_samples_groundtruth      ijba_samples_groundtruth
t = csv.reader(open(samples_path + 'facescrub_samples_groundtruth.csv'))
samples_list = []
for row in t:
    samples_list.append(row)

samples_feature_trg = []
samples_feature_qry = []
len_samples = len(samples_list)
for i in range(1, len_samples):
    qname = samples_list[i][2]
    tname = samples_list[i][4]
    qidx = qry_names.index(qname)
    tidx = trg_names.index(tname)
    qfeature = qry_feature[qidx]
    tfeature = trg_feature[tidx]
    samples_feature_qry.append(qfeature)
    samples_feature_trg.append(tfeature)

result_folder = samples_path + 'facescrub_samples_check/'
tep = csv.writer(open(result_folder + 'qry_feature.csv', 'wb'))
tep.writerows(samples_feature_qry)

tep2 = csv.writer(open(result_folder + 'trg_feature.csv', 'wb'))
tep2.writerows(samples_feature_trg)

print 'done'