%%MAIN FILE TO CALL ALL THE FUNCTIONS AND PRODUCE AN OUTPUT
close all; clear all;

Img_a = imread('E:\VIBOT\Applied Mathematics\proj\slopes_method\Img_a.jpeg');
Img_c = imread('E:\VIBOT\Applied Mathematics\proj\slopes_method\Img_c.jpeg');

[slope1, LATOUT1, LANOUT1] = corner_c(Img_c);
[slope2, LATOUT2, LANOUT2] = corner_a(Img_a);

slope_mat(slope1,slope2,LATOUT1,LANOUT1,LATOUT2,LANOUT2);
