% close all;
% clc;
% clear;
% 
% train_after_proc=train_data('train.csv');
pddistrict_count=zeros(39,10);
% year_count=zeros(39,13);
% month_count=zeros(39,12);
% date_count=zeros(39,31);
% week_count=zeros(39,7);
% hour_count=zeros(39,24);
[row,col]=size(train_after_proc);

for i=1:row
     pddistrict_count(train_after_proc(i,9),train_after_proc(i,6))=pddistrict_count(train_after_proc(i,9),train_after_proc(i,6))+1;
%     month_count(train_after_proc(i,9),train_after_proc(i,2))=month_count(train_after_proc(i,9),train_after_proc(i,2))+1;
%     date_count(train_after_proc(i,9),train_after_proc(i,3))=date_count(train_after_proc(i,9),train_after_proc(i,3))+1;
%     week_count(train_after_proc(i,9),train_after_proc(i,5))=week_count(train_after_proc(i,9),train_after_proc(i,5))+1;
%     hour_count(train_after_proc(i,9),train_after_proc(i,4)+1)=hour_count(train_after_proc(i,9),train_after_proc(i,4)+1)+1;
   
end
 xlswrite('pddistrict_count.xls', pddistrict_count);
% xlswrite('month_count.xls', month_count);
% xlswrite('date_count.xls', date_count);
% xlswrite('week_count.xls', week_count);
% xlswrite('hour_count.xls',hour_count);