import csv

# seperate pos and neg result
ground_truth = 'D:/zn_Projects/human_exp/result_analysis/EXP_V3_VGG/'
exp_result = ground_truth + 'result_group/all/'          #  'result/19 sr/'
db = 'ijba'  # facescrub    ijba
exp_result_list = []
t = csv.reader(open(exp_result + db +'_vote_result.csv')) #
for row in t:
    if row[0] == 'number':
        continue
    exp_result_list.append(row)

ground_truth_list = []
t = csv.reader(open(ground_truth + db + '_samples_groundtruth.csv'))
for row in t:
    if row[0] == 'number':
        continue
    ground_truth_list.append(row)

pos_result = []
neg_result = []
pos_truth = []
neg_truth = []
len_all = len(ground_truth_list)
for i in range(0, len_all):
    pair_type = ground_truth_list[i][6]
    if pair_type == '1':   # pos_pair
        pos_result.append(exp_result_list[i])
        pos_truth.append(ground_truth_list[i])

    if pair_type == '-1':
        neg_result.append(exp_result_list[i])
        neg_truth.append(ground_truth_list[i])

result_pos = exp_result + db + '_pos_result.csv'
t = open(result_pos, 'wb')
temp = csv.writer(t)
temp.writerows(pos_result)

result_neg = exp_result + db +'_neg_result.csv'
t = open(result_neg, 'wb')
temp = csv.writer(t)
temp.writerows(neg_result)

truth_pos = exp_result + db + '_pos_truth.csv'
t = open(truth_pos, 'wb')
temp = csv.writer(t)
temp.writerows(pos_truth)

truth_neg = exp_result + db + '_neg_truth.csv'
t = open(truth_neg, 'wb')
temp = csv.writer(t)
temp.writerows(neg_truth)

print 'done'