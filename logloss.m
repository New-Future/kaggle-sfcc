function [ll]=logloss(predict_label,predicted ,standar)
ll=0;
m=length(predicted);
% for j=1:m %��Ŀ
%     i=standar(j);
%     ll=ll-log(predicted(j,i));
%     max(min(p,1-10^-15),10^-15);
% end
% ll=ll/n;

n=length(predict_label);
for j=1:m %��Ŀ
    %     for i=1:n %��Ŀ
    i=find(predict_label==standar(j));
    p=predicted(j,i);
    if p>0
        ll=ll-log(p);
    end
end
ll=ll/n;
end