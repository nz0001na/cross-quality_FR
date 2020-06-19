import csv
import create_datafiles
import calc_similarity_matrix_def
import draw_roc_def
import create_mask_def
import calc_ROC_def
import os

exp_key = 'facescrub'
# read features and names
in_path = 'F:/zn1/znMCM/MsCeleb1M_code/0code_human_recognition/code_human_exp_tool/EXP_V3/facescrub_samples_check/'

far1 = 0.01  # 0.01  0.001  0.0001
far2 = 0.001
far3 = 0.0001

# read data
query_row_file = []
trg_col_file = []
qry_row_feature_file = []
trg_col_feature_file = []

# read query dataset (name_id, feature)
qry_row_names = csv.reader(open(in_path + 'qry_name_distinct.csv'))
for row in qry_row_names:
    query_row_file.append(row)
qry_row_feature = csv.reader(open(in_path + 'qry_feature_distinct.csv'))
for row in qry_row_feature:
    qry_row_feature_file.append(row)

# read target dataset (name_id, feature)
trg_col_names = csv.reader(open(in_path + 'trg_name_distinct.csv'))
for row in trg_col_names:
    trg_col_file.append(row)
trg_col_feature = csv.reader(open(in_path + 'trg_feature_distinct.csv'))
for row in trg_col_feature:
    trg_col_feature_file.append(row)

# create similarity matrix
calc_similarity_matrix_def.calc_similarity_mtx(exp_key, in_path, qry_row_feature_file, trg_col_feature_file, 'cosine')
# create similarity mask matrix
create_mask_def.create_mask(exp_key, in_path, query_row_file, trg_col_file)

calc_ROC_def.calc_ROC(exp_key, in_path, far1, mask_mtx_cutstom='')
calc_ROC_def.calc_ROC(exp_key, in_path, far2, mask_mtx_cutstom='')
calc_ROC_def.calc_ROC(exp_key, in_path, far3, mask_mtx_cutstom='')

# res_path = out_path + 'roc_' + exp_key + '.csv'
# draw_roc_def.draw_ROC(exp_key, out_path, res_path)