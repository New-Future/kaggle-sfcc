train_after_proc=load_train_by_year('train.csv');
trst_after_proc=load_test_by_year('test.csv');
Factor = mnrfit(train_after_proc(:,1:8),train_after_proc(:,9));
Scores = mnrval(Factor, test_after_proc(:,2:9));


csvwrite('logistic_scores.csv',Scores);