%OPTIMIZATION PROJECT - SHUBHAM WAGH, OMAIR KHALID & NAYEE MUDDIN DOUSAI
% THIS CODE TAKES THREE POINT CLOUDS AS INPUT AN DAPPLIES ICP ON THEM AFTER
% THE PRE-ALIGNMENT PROCEDURE

%%READING POINT CLOUDS
pointcloud_a = pcread('pointcloud_a.ply');
pointcloud_b = pcread('pointcloud_c.ply');
pointcloud_c = pcread('pointcloud_b.ply');

%%TAKING POINTCLOUDS A & B, AND DOWNSAMPLING THEM
grid_size = 0.1;
Target = pcdownsample(pointcloud_b, 'gridAverage', grid_size);
Source = pcdownsample(pointcloud_a, 'gridAverage', grid_size);

%INITIAL PRE-ALIGNMENT OF POINT CLOUDS
tform = affine3d([1 0 0 0 ;0 1 0 0 ; 0 0 1 0; 20 -100 0 1]);
Source = pctransform(Source,tform);

%%PERFORMING ITERATIVE POINT CLOUD PROCEDURE FOR POINT CLOUDS A & B
tform = pcregrigid(Source, Target, 'Metric','pointToPoint','InlierRatio',0.1);
ptCloudAligned = pctransform(Source,tform);
ptCloudScene = ptCloudAligned;


%%DOWNSAMPLING OF POINTCLOUDS C AND THE NEWLY FORMED POINTCLOUD ptCloudScene
grid_size = 0.1;
Target = pcdownsample(ptCloudScene, 'gridAverage', grid_size);
Source = pcdownsample(pointcloud_c, 'gridAverage', grid_size);

%%INITIAL PRE-ALIGNMENT OF POINT CLOUDS
tform = affine3d([1 0 0 0 ;0 1 0 0 ; 0 0 1 0; -70 -80 0 1]);
Source = pctransform(Source,tform);

%%PERFORMING ITERATIVE POINT CLOUD PROCEDURE
tform = pcregrigid(Source, Target, 'Metric','pointToPoint','InlierRatio',0.1);
ptCloudAligned = pctransform(Source,tform);


%%DISPLAYING THE RESULTS
figure
showPointCloud(ptCloudAligned); hold on;
showPointCloud(pointcloud_b); hold on;
showPointCloud(ptCloudScene); hold on;

