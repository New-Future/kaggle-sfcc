function [TRAIN_DATA,TEST_DATA]=buildTrainSet(data)%��������
%���ݻ��֣�����ֳ�4/5��ѵ��������1/5�Ĳ��Լ�
[m,n]=size(data);
%���ɲ��ظ����������
random_index=randperm(m);
%������е�ǰ4/5��Ϊѵ����
%ʣ�µ�1/5��Ϊ���Լ�
cut_line=floor(m*9/10);
train_index=random_index(1:cut_line);
test_index=random_index(cut_line+1:end);
TRAIN_DATA=data(train_index,:);
TEST_DATA=data(test_index,:);
end