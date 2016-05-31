% csvread('data/test.csv');
% fclose(fid);  
fid = fopen('data/test.csv');  
dcells = textscan(fid, '%s',7,'delimiter', ',');
headers=dcells{1};

data = textscan(fid, '%d32 %s %s %s %s %f %f','delimiter', ',')

fclose(fid);  
% dcellneeds = dcells(1:3);  
% Mat = cell2mat(dcellneeds);  
% disp(Mat);  
