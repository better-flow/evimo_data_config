PROCESSED
=========


 - '/calib/*'
 - '/sliding/2020-09-17-15-16-27.bag' (_00)
 - '/sliding/2020-09-17-15-20-48.bag' (_03)
 - 'checkerboard_flat_lr.bag'

 In 'sliding_03' for left_camera after frame 121, for right_camera after frame 195 - no events (with default settings)

 In 'checkerboard_flat_lr.bag', on prophesee camera events are unsorted and occasinally have negative timestamps, while
 on samsung there are gaps. Need to investigate. See https://github.com/better-flow/evimo/tree/evimo2/evimo/bag_sanity

DATA
=========
TODO script that downloads bulk data into the folder structure
There should be folder named `data` in the root, it is gitignored. It contains:
data:
* calib
* dataset_bags

`calib` contains data for each camera to perform joint intrinsic and extrinsic calibration
`dataset_bags` contains ROS bags. bagname.txt in each folder of evimo2 refers to a bag in this folder


