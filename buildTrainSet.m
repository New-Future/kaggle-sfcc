function [TRAIN_DATA,TEST_DATA]=buildTrainSet(data)%载入数据
%数据划分，随机分成4/5的训练集，和1/5的测试集
[m,n]=size(data);
%生成不重复的随机数列
random_index=randperm(m);
%随机数列的前4/5作为训练集
%剩下的1/5作为测试集
cut_line=floor(m*9/10);
train_index=random_index(1:cut_line);
test_index=random_index(cut_line+1:end);
TRAIN_DATA=data(train_index,:);
TEST_DATA=data(test_index,:);
end