import pyvision as pv
import numpy as np
import csv
import pyvision.analysis.roc as roc
import draw_roc_def
import scipy.stats as stats
import pylab as pl

def calc_ROC(experiment_key, out_path, far_value, mask_mtx_cutstom=''):   # ref_file, simi_mtx, mask_mtx_file, mask_mtx_cutstom=''):
    simi_mtx = np.load(out_path + 'facescrub_similarity_matrix.npy')
    mask_mtx_file = np.load(out_path + 'facescrub_similarity_mask_matrix.npy')
    ref_file = 'F:/zn1/znMCM/MsCeleb1M_code/0code_verification_python/matrix_output/pasc_lrpcamax_video_to_video_control_simi.mtx'

    print "Reading Similarity Matrix."
    scores = pv.BEEDistanceMatrix(ref_file)
    try1 = simi_mtx
    scores.matrix = try1

    print "Reading Mask Matrix."
    mask = pv.BEEDistanceMatrix(ref_file)
    try2 = mask_mtx_file
    mask.matrix = try2

    if(mask_mtx_cutstom!=''):
        mtx = np.load(mask_mtx_cutstom)
        mask.matrix = mtx

    print "Checking matrix."
    r, c = scores.matrix.shape
    if np.isfinite(scores.matrix).sum() != r * c:
        print "Warning %d of %d scores are not finite numbers" % (r * c - np.isfinite(scores.matrix).sum(), r * c)
        print "   Treating scores like poor matches"
        flat = scores.matrix.flatten()
        idx = np.isfinite(flat)
        mn = flat[idx].min()
        mx = flat[idx].max()
        if scores.is_distance:
            flat[~idx] = mx
        else:
            flat[~idx] = mn
        scores.matrix = flat.reshape(r, c)

    assert np.isfinite(scores.matrix).sum() == r * c

    print "Computing ROC."
    rocdata = scores.getROC(mask=mask)
    # get verification accuracy
    print "Get verification accuracy:"
    accuracy = rocdata.getFAR(far_value).tar
    print ("**** FAR=%f, accuracy=%f ****" % (far_value, accuracy))

    # # # Get Data of ROC curve
    # print "Get Data of ROC curve."
    # header, curve = rocdata.getCurve(method=roc.ROC_MATCH_SAMPLED)
    # res_path = out_path + 'roc_' + experiment_key + '_match.csv'
    # f = csv.writer(open(res_path, 'wb'))
    # f.writerow(header)
    # f.writerows(curve)
    # # draw_roc_def.draw_ROC(experiment_key, out_path, ref_file, res_path, plot_others=0)
    # draw_roc_def.draw_ROC(experiment_key, out_path, res_path)


    # # Get impostor and genuine score distribution
    # print "Get score distribution"
    # # m = len(rocdata.match)
    # order = rocdata.match.argsort()
    # match_scores = 0 - rocdata.match[order]
    # fit = stats.norm.pdf(match_scores, np.mean(match_scores), np.std(match_scores))  # this is a fitting indeed
    # # pl.plot(match_scores, fit, linewidth=2, color='blue')
    # # pl.hist(match_scores, 100, normed=True)  # use this to draw histogram of your data
    # pl.plot(match_scores, fit, '-b', label='Genuine')
    #
    # # non match
    # # n = len(rocdata.nonmatch)
    # norder = rocdata.nonmatch.argsort()
    # nonmatch_scores = 0 - rocdata.nonmatch[norder]
    # nfit = stats.norm.pdf(nonmatch_scores, np.mean(nonmatch_scores), np.std(nonmatch_scores))
    # # pl.plot(nonmatch_scores, nfit, linewidth=2, color='red')
    # pl.plot(nonmatch_scores, nfit, '-r', label='Impostor')
    # # pl.hist(nonmatch_scores, 100, normed=True)
    #
    # # leg = []
    # # leg.append('Genuine Scores')
    # # leg.append('Impostor Scores')
    # # pl.legend(leg, loc='upper left')
    # pl.legend(loc='upper left')
    #
    # pl.xlim([-1, 1])
    # # pl.ylim([0.0, 1])
    # pl.xlabel('Match Scores', fontsize=15)
    # pl.ylabel('Statistic number(s)', fontsize=15)
    # pl.title('match score distribution', fontsize=20) #and impostor   genuine
    # pl.grid()
    # pl.show()

    return accuracy   # FAR equals 0.01, 0.001, 0.0001.




