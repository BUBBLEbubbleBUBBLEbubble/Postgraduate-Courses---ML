function m = get_iter_th(Imgray) 
% ��������Ҷ�ͼ���ֵ��ʱ����ֵ�����õ�����
% ��ֵ
mingray = min(min(Imgray));
maxgray = max(max(Imgray));
% ��ʼ�ָ���ֵ
m = double(mingray)/2+double(maxgray)/2;
while 1
    % ����
    a = find(Imgray<=m);
    % ��ֵ
    A = sum(Imgray(a))/length(a);
    % ǰ��
    b = find(Imgray>m);
    % ��ֵ
    B = sum(Imgray(b))/length(b);
    % ����
    n = (A+B)/2;
    % ��������쳣����
    if isnan(n)
        break;
    end
    if abs(m-n) < 1
        % ��������
        break;
    else
        % ����
        m = n;
    end
end