
% % % % �б����
Factor = ClassificationDiscriminant.fit(train_after_proc(:,1:8), train_after_proc(:,9));
Scores =  predict(Factor, test_after_proc(:,2:9));
% % % % �߼��ع�
Factor = mnrfit(train_after_proc(:,1:8),train_after_proc(:,9));
Scores = mnrval(Factor, test_after_proc(:,2:9));

% % % % ���ر�Ҷ˹
Factor = NaiveBayes.fit(train_after_proc(:,1:8), train_after_proc(:,9));
predict_label   =       predict(Factor, test_after_proc(:,2:9));
Scores        =       length(find(predict_label == test_label))/length(test_label)*100;

csvwrite('�ļ���.csv',Scores);
