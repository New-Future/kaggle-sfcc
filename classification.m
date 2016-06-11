train_after_proc=load_train_by_year('train.csv');
trst_after_proc=load_test_by_year('test.csv');
Factor = ClassificationDiscriminant.fit(train_after_proc(:,1:8), train_after_proc(:,9));
Scores =  predict(Factor, test_after_proc(:,2:9));


csvwrite('classification_scores.csv',Scores);