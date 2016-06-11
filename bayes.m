train_after_proc=load_train_by_year('train.csv');
trst_after_proc=load_test_by_year('test.csv');

Factor = NaiveBayes.fit(train_after_proc(:,1:8), train_after_proc(:,9));
predict_label   =       predict(Factor, test_after_proc(:,2:9));
Scores        =       length(find(predict_label == test_label))/length(test_label)*100;

csvwrite('bayes_scores.csv',Scores);