import csv

r_path = 'D:/zn_Projects/human_exp/result_analysis/EXP_V3_VGG/result_group/all/'   #result_group/group2_4
db = 'facescrub'   # facescrub    ijba
pos_result = r_path + 'ROC_' + db + '/' + db + '_pos_result.csv'
neg_result = r_path + 'ROC_' + db + '/' + db + '_neg_result.csv'

pos_list = []
neg_list = []
t = csv.reader(open(pos_result))
for row in t:
    r = row[0]
    pos_list.append(r)

t = csv.reader(open(neg_result))
for row in t:
    r = row[0]
    neg_list.append(r)

# pos: truth=1
length_pos = len(pos_list)
truth_count1 = pos_list.count('1')
pos_accuracy = truth_count1 / float(length_pos)
print 'pos_accuracy:' + str(pos_accuracy)

truth_count2 = neg_list.count('-1')
neg_accuracy = truth_count2 / float(len(neg_list))
print 'neg_accuracy:' + str(neg_accuracy)

total_accuracy = (truth_count1 + truth_count2) / (float(length_pos) + float(len(neg_list)))
print 'total_accuracy:' + str(total_accuracy)
print 'done'