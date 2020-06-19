import csv

in_path = 'F:/zn1/znMCM/MsCeleb1M_code/0code_human_recognition/code_human_exp_tool/EXP_V3/facescrub_samples_check/'
qry_names = []
qry_name_id = []
qry_feature = []
t = csv.reader(open(in_path + 'qry_name.csv'))
p = csv.reader(open(in_path + 'qry_feature.csv'))
for r in p:
    qry_feature.append(r)

i = 0
qry_feature_dis = []
for row in t:
    name = row[0]
    print name
    if name not in qry_names:
        qry_names.append(name)
        qry_name_id.append(row)
        qry_feature_dis.append(qry_feature[i])
    i = i+1

t = csv.writer(open(in_path + 'qry_name_distinct.csv', 'wb'))
t.writerows(qry_name_id)

p = csv.writer(open(in_path + 'qry_feature_distinct.csv', 'wb'))
p.writerows(qry_feature_dis)


trg_names = []
trg_name_id = []
trg_feature = []
t = csv.reader(open(in_path + 'trg_feature.csv'))
for row in t:
    trg_feature.append(row)

t = csv.reader(open(in_path + 'trg_name.csv'))
i = 0
trg_feature_dis = []
for row in t:
    name = row[0]
    if name not in trg_names:
        trg_names.append(name)
        trg_name_id.append(row)
        trg_feature_dis.append(trg_feature[i])
    i = i+1

t = csv.writer(open(in_path + 'trg_name_distinct.csv', 'wb'))
t.writerows(trg_name_id)

p = csv.writer(open(in_path + 'trg_feature_distinct.csv', 'wb'))
p.writerows(trg_feature_dis)

print 'done'