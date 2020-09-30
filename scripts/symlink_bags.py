#!/usr/bin/env python3
import argparse
from glob import glob
import os
from pathlib import Path, PurePath

DATA_DIR = './data/dataset_bags'
EVIMO_DIR = './evimo2'

bagfiles = sorted(Path(DATA_DIR).rglob('*.bag'))
datasets = sorted(glob(EVIMO_DIR + '/*/'))

for dataset in datasets:
    dataset_name = PurePath(dataset).name
    with open(os.path.join(dataset, 'bagname.txt')) as bag_name_file:
        desired_bag_name = bag_name_file.readline().rstrip()

    for bagfile in bagfiles:
        if bagfile.name == desired_bag_name:
            symlink_name = os.path.join(dataset,dataset_name) + '.bag'
            try:
                relative_bagfile_path = '../../' + str(bagfile)
                os.symlink(relative_bagfile_path, symlink_name)
                print('linked {} to {}'.format(symlink_name, relative_bagfile_path))
            except Exception as e:
                #print(e)
                pass # this is dangerous

