#!/usr/bin/python3

import sys, os

# its a dataset folder is at least one of camera_folders is in it, as well as objectstxt:
camera_folders = set(['flea3_7', 'left_camera', 'right_camera', 'samsung_mono'])
objectstxt = 'objects.txt'
blacklisted = set(['ground_truth'])

def get_dataset_folders(folder):
    ret = []
    if (not os.path.isdir(folder)): return ret
    subfolder_names = os.listdir(folder)

    is_df = False
    for cf in camera_folders:
        if cf in subfolder_names: is_df = True
    if objectstxt not in subfolder_names: is_df = False

    if (is_df): ret.append(folder)

    for f in subfolder_names:
        if (f in blacklisted): continue
        ret += get_dataset_folders(os.path.join(folder, f))
    return ret


dataset_folders = get_dataset_folders('.')

df_no_bagfiles = []
df_to_regenerate = []
df_partial_regenerate = {}

for df in sorted(dataset_folders):
    if ('_template' in df): continue

    subfolders = os.listdir(df)

    bag_file = None
    cameras = {}
    for sf in subfolders:
        if '.bag' in sf:
            bag_file = sf
        if (sf in camera_folders):
            cameras[sf] = []

    for c in cameras.keys():
        for sf in subfolders:
            if (c in sf) and ('.mp4' in sf):
                cameras[c].append(sf)

    print ()
    print (df)
    print ("\tbag file:\t", bag_file)
    for c in cameras.keys():
        print ("\t\t", c, ":\t", cameras[c])

    if (bag_file is None):
        df_no_bagfiles.append(df)

    complete_regen = True
    for c in cameras.keys():
        if len(cameras[c]) > 0: complete_regen = False
    if (complete_regen): df_to_regenerate.append(df)

    if (not complete_regen):
        for c in cameras.keys():
            if len(cameras[c]) > 0: continue
            if df not in df_partial_regenerate.keys(): df_partial_regenerate[df] = []
            df_partial_regenerate[df].append(c)


if (len(df_no_bagfiles) > 0):
    print ("\nFolders without .bag files:")
    for df in sorted(df_no_bagfiles):
        print("\t", df)

if (len(df_to_regenerate) > 0):
    print ("\nFolders without ground truth at all:")
    for df in sorted(df_to_regenerate):
        print("\t", df)

if (len(df_partial_regenerate.keys()) > 0):
    print ("\nFolders with ground truth missing for some cameras:")
    for df in sorted(df_partial_regenerate.keys()):
        print("\t", df, ':', sorted(df_partial_regenerate[df]))
