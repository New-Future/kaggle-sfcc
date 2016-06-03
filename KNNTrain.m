% Factor = fitensemble(train_data, train_label, 'Subspace', 50, 'KNN');
init;

[trainSet,testSet]= buildTrainSet(train_data{2});

Factor = ClassificationKNN.fit(trainSet(:,1:7), trainSet(:,8), 'NumNeighbors', 10);
[label,score] = predict(Factor, testSet(:,1:7));
% loss=logloss(label,score,testSet(:,8))
