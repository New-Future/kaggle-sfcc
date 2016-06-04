% Factor=ClassificationDiscriminant.fit(tdata,rdata);
% 
% t=predict(Factor,tdata);
% x=t-rdata;
% length(find(x(:)~=0))
train_after_proc=readtrain('data/train.csv')
ntrees=500;
Factor = TreeBagger(ntrees, train_after_proc(:,1:8), train_after_proc(:,9));
[Predict_label,Scores] = predict(Factor, train_after_proc(:,1:8));