% 帧间差分法
clc; clear all; close all;
% % 读视频文件
% mov = VideoReader(fullfile(pwd, 'video', 'video.avi'));
% % 获取视频文件帧个数
% nframes = mov.NumberOfFrames;
myfile=dir(fullfile(pwd, 'tracking_images\*.jpg'));
lengthfile=length(myfile);


for k = 1 : lengthfile
    % 读取第k帧，作为当前帧
%   currentFrame = read(mov, k);
    currentFrame=imread(fullfile(pwd, 'tracking_images', myfile(k).name));
    % 灰度化
    grayFrame = rgb2gray(currentFrame);
    if k == 1
        % 如果是第一帧
        grayFrame_pre = grayFrame;
    end
    % 邻帧差
    difgrayFrame = abs(double(grayFrame) - double(grayFrame_pre));
    difgrayFrame = im2uint8(mat2gray(difgrayFrame));
    % 二值化
    th = 20;
    difBW = im2bw(difgrayFrame, th/255);
    % 更新
    grayFrame_pre = grayFrame;
    % 显示
    figure(1);
    set(gcf,'position',[200,150,1000,500]);
    subplot(1,3,1), imshow(currentFrame, []), title(['No.' num2str(k) ' Frame']);
    subplot(1,3,2), imshow(difgrayFrame, []), title('The image after difference');
    subplot(1,3,3), imshow(currentFrame, []), title('Binarization image after difference');
    % 找出图像中的八连通区域，视为目标所在的区域
    [L, num] = bwlabel(difBW, 8);
    if num == 0
        continue;
    end
    % 找出最大区域
    stats = regionprops(L);
    % 整合
    Ar = cat(1, stats.Area);
    % 最大区域
    [~, ind_max_ar] = max(Ar);
    % 提取目标
    rect = stats(ind_max_ar).BoundingBox;
    if rect(4) > size(currentFrame, 2)*0.25 && rect(4) < size(currentFrame, 2)*0.5
        % 对前景用矩形标记
        rectangle('Position', rect, 'EdgeColor', 'r');
    end
    pause(0.001);
end