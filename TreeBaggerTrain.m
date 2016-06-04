
init;

[trainSet,testSet]= buildTrainSet(train_data{2});
ntrees=150;
Factor = TreeBagger(ntrees, trainSet(:,1:7), trainSet(:,8));
[pre_labels,scores] = predict(Factor, testSet(:,1:7));

labels=unique(pre_labels);
l=length(labels);
label=zeros(1,l);

for i = 1:l
    label(i)=str2num(labels{i});
end
label=sort(label);
loss=logloss(label,scores,testSet(:,8))