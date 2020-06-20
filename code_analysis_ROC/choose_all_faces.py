import os
import shutil
import csv

src_face = 'C:/Users/Nana/Downloads/facescrub_vggface_crop/'
out_path = 'D:/zn_Projects/human_exp/pairs_output/VGGFace/0220_LvsH/'
#
# # if os.path.exists(out_path) == False:
# #     os.makedirs(out_path)
# # os.makedirs(out_path + 'all_query/')
# # os.makedirs(out_path + 'all_target/')
#
# src_face_high = src_face + 'low/'
# # fns = [os.path.join(root, fn) for root, dirs, files in os.walk(src_face_high) for fn in files]
# fns = os.listdir(src_face_high)
# for i in range(0, len(fns)):
#     id = fns[i]
#     files = os.walk(src_face_high + id + '/').next()[2]
#     for j in range(0, len(files)):
#         name = files[j]
#         img_path = src_face_high + id + '/' + name
#         shutil.copy(img_path, out_path + 'all_query/')


# out_path = 'F:/zn1/znMCM/MsCeleb1M_code/0code_human_recognition/pairs_output/CenterLoss/0220_V2_LvsH/facescrub_faces/'
# if os.path.exists(out_path) == False:
#     os.makedirs(out_path)
# os.makedirs(out_path + 'all_query/')
# os.makedirs(out_path + 'all_target/')

csv_path = out_path + 'impostor_match_score.csv'
t = csv.reader(open(csv_path))
for row in t:
    qry_name = row[0]
    if qry_name == 'qry_name':
        continue
    qry_id = row[1]
    # trg_name = row[2]
    # trg_id = row[3]

    dest_path = out_path + 'all_query/'
    des_names = []
    fns = [os.path.join(root, fn) for root, dirs, files in os.walk(dest_path) for fn in files]
    for f in fns:
        dirs = f.split('/')
        des_names.append(dirs[7])
    if qry_name in des_names:
        continue

    qry_path = src_face + qry_id + '/' + qry_name
    shutil.copy(qry_path, out_path + 'all_query/')
    # trg_path = src_face + trg_id + '/' + trg_name
    # shutil.copy(trg_path, out_path + 'all_target/')

print "done"
