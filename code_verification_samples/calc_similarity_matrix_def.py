import numpy as np
import os.path
from scipy import spatial
import sys
import csv

def calc_similarity_mtx(experiment_key, out_path, qry_row_feature_file, trg_col_feature_file, distance_fun):

    # read all features(include row and col)
    print('Calc similarity matrix : ' + experiment_key)
    print ('Loading features')
    qur_vid_feature = qry_row_feature_file
    trg_vid_feature = trg_col_feature_file

    d = spatial.distance.cdist(qur_vid_feature, trg_vid_feature, distance_fun)
    vid_simi = 1 - d

    # save to file
    res_path = out_path + '{}_similarity_matrix.npy'.format(experiment_key)
    np.save(res_path, vid_simi)

    simi = open(out_path + experiment_key + '_similarity_matrix.csv', 'wb')
    s = csv.writer(simi)
    s.writerows(vid_simi)
    print 'Similarity matrix is created!'
    return res_path
