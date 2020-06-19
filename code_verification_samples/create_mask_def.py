import numpy as np
import csv

def create_mask(experiment_key, out_path, query_row_file, trg_col_file):
    print 'Create mask matrix:' + experiment_key
    # read pair list
    pair_list = []
    t = csv.reader(open(out_path + 'facescrub_samples_pairs.csv'))
    for row in t:
        if row[0] == 'number':
            continue
        pair_list.append(row)

    qur_len = len(query_row_file)
    trg_len = len(trg_col_file)
    res = np.zeros((qur_len, trg_len))

    list_size = len(pair_list)
    for i in range(0, list_size):
        qry_name = pair_list[i][1]
        qry_id = pair_list[i][2]
        trg_name = pair_list[i][3]
        trg_id = pair_list[i][4]
        item = [qry_name, qry_id]
        index_qry = query_row_file.index(item)
        item = [trg_name, trg_id]
        index_trg = trg_col_file.index(item)
        if qry_id == trg_id:
            res[index_qry, index_trg] = -1
        else:
            res[index_qry, index_trg] = 127

    p = np.sum(res == -1)
    n = np.sum(res == 127)

    print p
    print n
    # save result (.npy and .csv)
    res_path = out_path + '{}_similarity_mask_matrix.npy'.format(experiment_key)
    np.save(res_path, res)

    simi_mask = open(out_path + experiment_key + '_similarity_mask_matrix.csv', 'wb')
    mask = csv.writer(simi_mask)
    mask.writerows(res)
    print 'Mask matrix is created!'
    return res_path