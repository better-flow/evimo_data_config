#!/bin/bash

kalibr_bagcreater --folder collected_frames/
kalibr_calibrate_cameras --models pinhole-radtan  pinhole-radtan  pinhole-radtan --target target.yaml --bag output.bag --topics /cam_1/image_raw /cam_2/image_raw /cam_3/image_raw
