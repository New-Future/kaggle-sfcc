% function train_year=train_year_num(year_num);

% train_data=importdata('train_guiyi.csv');
% test_data=importdata('test_guiyi.csv');
% Factor = ClassificationDiscriminant.fit(train_after_proc(:,1:8), train_after_proc(:,9));
% [predict_label, Scores] =  predict(Factor, test_after_proc(:,2:9));
Factor = mnrfit(train_after_proc(:,2:8), train_after_proc(:,9));
Scores = mnrval(Factor, test_after_proc(:,3:9));
