info = dicominfo('000176.dcm');
Y = dicomread(info);
figure, imshow(Y);
% histogram equalization
J = histeq(Y, 50);
figure, imshow(J)
%コントラスト調整ツール
figure, imshow(Y);
imcontrast
Y=double(Y)/max(max(double(Y)));
level = graythresh(Y)
[level EM] = graythresh(Y);
BW = im2bw(Y,level);
imshow(BW)  %大津法(Otsu method):背景の除去

SE=strel('disk',5);
BW1 = imerode(BW,SE);
imshow(BW1)  %膨張で白い点(血管)を除去

SE=strel('disk',6);
BW2 = imdilate(BW1,SE);
imshow(BW2)  %収縮で黒い点を除去

