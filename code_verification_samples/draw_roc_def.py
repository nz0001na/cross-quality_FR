from matplotlib import pyplot as plt
import numpy as np
import pyvision.analysis.roc as roc
import pandas as pd

def draw_ROC(title, in_path, roc_file):
# def draw_ROC(title, in_path, ref_file, roc_file, plot_others=0):
    print "Draw ROC Curve..."
    # file_path = roc_file
    df = pd.read_csv(roc_file)
    far = list(df.far)
    tar = list(df.tar)

    # #file_path = in_path + ref_file
    # import pandas as pd
    #
    # df = pd.read_csv(ref_file)
    # far1 = list(df.far)
    # tar1 = list(df.tar)
    #
    # file_path = ref_file
    # import pandas as pd
    # # fig = plt.figure()
    # leg=[]
    # if(plot_others == 1):
    #     df = pd.read_csv(file_path)
    #     far_others = [np.math.pow(10, x) for x in list(df['log10(FAR)'])]
    #     # far_others = list(df['log10(FAR)'])
    #     tar_others = {}
    #
    #     for name in df.columns[1::]:
    #         tar_others[name] = (list(df[name]))
    #
    #     # Plot of a ROC curve for a specific class
    #     for key, val in sorted(tar_others.items()):
    #         plt.plot(far_others, val, label=key, linewidth=2)
    #     leg = [x for x in sorted(tar_others.keys())]


    # plt.plot(far1, tar1, label='Face + Body', linewidth=2)
    plt.plot(far, tar, linewidth=2, label='Face Only', color='blue')
    # leg.append('Face + Body')
    # leg.append('Face Only')
    # plt.legend(leg, loc=4)

    # plt.plot([0, 1], [0, 1], 'k--')
    plt.xlim([0.0001, 1])
    plt.ylim([0.0, 1.05])
    # plt.xscale('log')
    plt.xlabel('False Acceptance Rate (FAR)', fontsize=15)
    plt.ylabel('Verification Rate (TAR)', fontsize=15)
    plt.title(title, fontsize=20)

    plt.grid()
    # or if you want differnet settings for the grids:
    # plt.grid(True, which='minor', alpha=0.8)

    #plt.legend(loc="lower right")
    plt.show()

    print "done"