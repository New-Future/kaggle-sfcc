% Factor = fitensemble(train_data, train_label, 'Subspace', 50, 'KNN');
Factor = ClassificationKNN.fit(train_after_proc(:,1:8), train_after_proc(:,9), 'NumNeighbors', 10);
% predict_label = predict(Factor, test_data);
[predict_label, Scores] = predict(Factor, train_after_proc(:,1:8));