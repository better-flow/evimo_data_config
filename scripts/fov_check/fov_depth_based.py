#!/usr/bin/python3

import argparse
import numpy as np
import matplotlib.pyplot as plt
import os, sys, math, signal, glob
import cv2


def get_fov_depth(dc, dl, dr):
    b = float(dc) * (float(dl) + float(dr)) / (2.0 * float(dl) * float(dr))
    print ("b =", b)
    return np.degrees(2 * np.arccos(b))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('fname',
                        type=str)
    args = parser.parse_args()

    gt_img = cv2.imread(args.fname, cv2.IMREAD_UNCHANGED)

    depth = gt_img[:,:,0] # depth is in mm
    mask  = gt_img[:,:,2] # mask is object ids * 1000
    
    print ("Shape:", depth.shape)
    d_center = depth[depth.shape[0] // 2, depth.shape[1] // 2]
    d_u = depth[0,  depth.shape[1] // 2]
    d_d = depth[-1, depth.shape[1] // 2]
    d_l = depth[depth.shape[0] // 2,  0]
    d_r = depth[depth.shape[0] // 2, -1]
    d_ul = depth[0,   0]
    d_dl = depth[-1,  0]
    d_ur = depth[0,  -1]
    d_dr = depth[-1, -1]
    print (d_center, d_u, d_d, d_l, d_r)
    print (d_ul, d_dl, d_ur, d_dr)

    print ("hfov:", get_fov_depth(d_center, d_l, d_r))
    print ("vfov:", get_fov_depth(d_center, d_u, d_d))

    print ("diag0 fov:", get_fov_depth(d_center, d_ul, d_dr))
    print ("diag1 fov:", get_fov_depth(d_center, d_dl, d_ur))
    
