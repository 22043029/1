SE=strel('disk',6);
BW2 = imdilate(BW1,SE);
imshow(BW2)  %収縮で黒い点を除去

info = dicominfo('000034.dcm');
Y = dicomread(info);
figure, imshow(Y);
% histogram equalization
J = histeq(Y, 50);
figure, imshow(J)
%コントラスト調整ツール
figure, imshow(Y);
imcontrast