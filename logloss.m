function [ll]=logloss(predicted ,standar)
ll=0;
[m,n]=size(predicted);
% for j=1:m %条目
%     i=standar(j);
%     ll=ll-log(predicted(j,i));
%     max(min(p,1-10^-15),10^-15);
% end
% ll=ll/n;

for j=1:m %条目
%     for i=1:n %条目
      i=standar(j);
      p=predicted(j,i);
      if p>0
          ll=ll-log(p);
      end
end
ll=ll/n;
end