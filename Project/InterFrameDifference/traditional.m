% ֡���ַ�
clc; clear all; close all;
% % ����Ƶ�ļ�
% mov = VideoReader(fullfile(pwd, 'video', 'video.avi'));
% % ��ȡ��Ƶ�ļ�֡����
% nframes = mov.NumberOfFrames;
myfile=dir(fullfile(pwd, 'tracking_images\*.jpg'));
lengthfile=length(myfile);


for k = 1 : lengthfile
    % ��ȡ��k֡����Ϊ��ǰ֡
%   currentFrame = read(mov, k);
    currentFrame=imread(fullfile(pwd, 'tracking_images', myfile(k).name));
    % �ҶȻ�
    grayFrame = rgb2gray(currentFrame);
    if k == 1
        % ����ǵ�һ֡
        grayFrame_pre = grayFrame;
    end
    % ��֡��
    difgrayFrame = abs(double(grayFrame) - double(grayFrame_pre));
    difgrayFrame = im2uint8(mat2gray(difgrayFrame));
    % ��ֵ��
    th = 20;
    difBW = im2bw(difgrayFrame, th/255);
    % ����
    grayFrame_pre = grayFrame;
    % ��ʾ
    figure(1);
    set(gcf,'position',[200,150,1000,500]);
    subplot(1,3,1), imshow(currentFrame, []), title(['No.' num2str(k) ' Frame']);
    subplot(1,3,2), imshow(difgrayFrame, []), title('The image after difference');
    subplot(1,3,3), imshow(currentFrame, []), title('Binarization image after difference');
    % �ҳ�ͼ���еİ���ͨ������ΪĿ�����ڵ�����
    [L, num] = bwlabel(difBW, 8);
    if num == 0
        continue;
    end
    % �ҳ��������
    stats = regionprops(L);
    % ����
    Ar = cat(1, stats.Area);
    % �������
    [~, ind_max_ar] = max(Ar);
    % ��ȡĿ��
    rect = stats(ind_max_ar).BoundingBox;
    if rect(4) > size(currentFrame, 2)*0.25 && rect(4) < size(currentFrame, 2)*0.5
        % ��ǰ���þ��α��
        rectangle('Position', rect, 'EdgeColor', 'r');
    end
    pause(0.001);
end