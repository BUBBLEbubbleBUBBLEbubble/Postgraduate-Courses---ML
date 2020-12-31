function m = get_iter_th(Imgray) 
% 用来计算灰度图像二值化时的阈值，采用迭代法
% 最值
mingray = min(min(Imgray));
maxgray = max(max(Imgray));
% 初始分割阈值
m = double(mingray)/2+double(maxgray)/2;
while 1
    % 背景
    a = find(Imgray<=m);
    % 均值
    A = sum(Imgray(a))/length(a);
    % 前景
    b = find(Imgray>m);
    % 均值
    B = sum(Imgray(b))/length(b);
    % 计算
    n = (A+B)/2;
    % 如果出现异常数据
    if isnan(n)
        break;
    end
    if abs(m-n) < 1
        % 满足条件
        break;
    else
        % 迭代
        m = n;
    end
end