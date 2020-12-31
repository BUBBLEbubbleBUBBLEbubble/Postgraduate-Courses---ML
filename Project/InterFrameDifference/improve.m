% �Ľ���֡���ַ�
clc; clear all; close all;
% ��ʼ֡
nStar = 1;
% ����Ƶ�ļ�
mov = VideoReader(fullfile(pwd, 'video', 'video.avi'));
% ��ȡ��Ƶ�ļ�֡����
nframes = mov.NumberOfFrames;
% ��һ֡������ʼ����
Background = double( rgb2gray(read(mov, nStar) ));
for k = nStar+1 : 80
    % ��ǰ֡
    CurrentImage = double(rgb2gray(read(mov, k) ));
    % ǰһ֡
    FormerImage = double(rgb2gray(read(mov, k-1) ));
    % ֡����
    difgrayFrame = im2uint8(mat2gray(abs(CurrentImage - FormerImage )));
    % �����������ֵ����ֵ
    th = get_iter_th(difgrayFrame);
    difBW = im2bw(difgrayFrame, th/255);
    % �������µ��ٶ�
    alpha = 0.1;
    % ǰ����֡�б仯�����򲻸��£��ޱ仯��������µ�������ȥ
    CurrentBack = Background.*difBW + ( alpha.* CurrentImage + ( 1-alpha ).* Background ).*( 1 - difBW );
    % �����������
    Background = CurrentBack;
    % ǰ���뱳�����
    Cut = abs(double(CurrentImage) - double(Background));
    Cut = im2uint8(mat2gray(Cut));
    % �����������ֵ����ֵ
    cutT = get_iter_th(Cut);
    % ��ֺ��ͼ����ж�ֵ��
    cutBW = im2bw(Cut, cutT/255);
    % �ṹԪ��
    SE = ones(5, 5);
    % �Զ�ֵͼ����и�ʴ��������΢С�䶯����
    CuterBW = imclose(cutBW, SE);
    figure(1);
      set(gcf,'position',[200,150,1000,500]);
    subplot(1,3,1), imshow(CurrentImage, []), title(['No.' num2str(k) ' Frame']);
    subplot(1,3,2), imshow(Cut, []), title('The image after difference');
    subplot(1,3,3), imshow(CurrentImage, []), title('Binarization image after difference')
    % �ҳ�ͼ���еİ���ͨ������ΪĿ�����ڵ�����
    [L, ~] = bwlabel(CuterBW, 8);
    % �ҳ��������
    stats = regionprops(L);
    % ����
    Ar = cat(1, stats.Area);
    % �������
    [~, ind_max_ar] = max(Ar);
    % ��ȡĿ��
    rect = stats(ind_max_ar).BoundingBox;
    if rect(4) > size(CurrentImage, 2)*0.25 && rect(4) < size(CurrentImage, 2)*0.5
        % ��ǰ���þ��α��
        rectangle('Position', rect, 'EdgeColor', 'r');
    end    
    pause(0.001);
end

