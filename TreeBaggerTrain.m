% Factor=ClassificationDiscriminant.fit(tdata,rdata);
% 
% t=predict(Factor,tdata);
% x=t-rdata;
% length(find(x(:)~=0))

Factor = TreeBagger(500, train_after_proc(1:20000,1:8), train_after_proc(1:20000,9));
[Predict_label,Scores] = predict(Factor, train_after_proc(:,1:8));