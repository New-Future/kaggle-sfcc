clear;
%%训练数据
if exist('train_data_by_year.mat','file')
    load('train_data_by_year.mat');
else
    train_data=load_train_by_year('data/train.csv');
end


%%测试数据
if exist('test_data_by_year.mat','file')
    load('test_data_by_year.mat');
else
    test_data=load_test_by_year('data/test.csv');
end
