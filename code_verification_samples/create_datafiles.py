# coding: utf-8
import os
import csv

def create_datafile(deep_model, probe_gallery, probe, gallery, exp_key, version):
    # FaceNet
    #in_path = 'F:/zn1/znMCM/MsCeleb1M_code/code_deep_fr/feature_output/' + deep_model + '/' + version + '/'
    #out_path = 'F:/zn1/znMCM/MsCeleb1M_code/0code_verification_python/data_files/' + deep_model + '/' + version + '_' + probe_gallery + '/'
    in_path = 'F:/zn1/znMCM/MsCeleb1M_code/datasets_IJBA/statistic_rqs_3f/QAoutput/'
    out_path = 'F:/zn1/znMCM/MsCeleb1M_code/0code_verification_python/data_files/gabor_ijba/'
    if (os.path.exists(out_path) == False):
        os.makedirs(out_path)
    #row_path = in_path + probe + '/'
    #col_path = in_path + gallery + '/'

    # generate query row file
    print ("Read feature and names: " + exp_key)
    row_namelist = os.listdir(in_path)
    row_names = []
    row_features = []
    for i in row_namelist:
        sub_row_path = in_path + i + '/'
        if os.path.exists(sub_row_path + i + '_middle_scores.csv'):
            message = 'OK, the "%s" file exists.'
        else:
            continue

        sub_row_names = csv.reader(open(sub_row_path + i + '_middle_scores.csv'))
        sub_row_features = csv.reader(open(sub_row_path + i + '_middle_feature.csv'))
        for row in sub_row_names:
            id = i
            row_list = [row[0], id]
            row_names.append(row_list)
        for row in sub_row_features:
            row_features.append(row)

    # save query row data
    out_row_name = open(out_path + 'qur_row_name.csv', 'wb')
    file_names = csv.writer(out_row_name)
    file_names.writerows(row_names)

    out_row_feature = open(out_path + 'qur_row_feature.csv', 'wb')
    file_features = csv.writer(out_row_feature)
    file_features.writerows(row_features)

    # generate gallery target file
    col_namelist = os.listdir(in_path)
    col_names = []
    col_features = []
    for i in col_namelist:
        sub_col_path = in_path + i + '/'
        if os.path.exists(sub_col_path + i + '_high_scores.csv'):
            message = 'OK, the "%s" file exists.'
        else:
            continue

        sub_col_names = csv.reader(open(sub_col_path + i + '_high_scores.csv'))
        sub_col_features = csv.reader(open(sub_col_path + i + '_high_feature.csv'))
        for row in sub_col_names:
            id = i
            row_list = [row[0], id]
            col_names.append(row_list)
        for row in sub_col_features:
            col_features.append(row)

    # save target col data
    out_col_name = open(out_path + 'trg_col_name.csv', 'wb')
    file_names2 = csv.writer(out_col_name)
    file_names2.writerows(col_names)

    out_col_feature = open(out_path + 'trg_col_feature.csv', 'wb')
    file_features2 = csv.writer(out_col_feature)
    file_features2.writerows(col_features)

    return out_path
    # merge
"""
label_name = open(out_path + 'label_file.csv', 'wb')
label_names = csv.writer(label_name)
row_names.extend(col_names)
# L1[0:0] = L2

label_names.writerows(row_names)

feature = open(out_path + 'feature_file.csv', 'wb')
features = csv.writer(feature)
row_features.extend(col_features)
features.writerows(row_features)
"""

