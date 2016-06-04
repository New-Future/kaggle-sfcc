function train_after_proc=train_cell(old_data);

train_befor_proc=importdata(old_data);
[row,col]=size(train_befor_proc.textdata)
% 创建一个row*9的矩阵，初始化该矩阵全为0
%该矩阵的每一维分别是：
%year,month,date,hour,days of week,PdDistrict,X,Y,category
train_after_proc=cell([row,9]);
%循环处理
for i=1:row-1
    Dates = train_befor_proc.textdata{i+1,1};
    DayOfWeek = train_befor_proc.textdata{i+1,4};
    PdDistrict = train_befor_proc.textdata{i+1,5};
    Address = train_befor_proc.textdata{i+1,7};
    X = train_befor_proc.data(i,1)+122;
    Y = train_befor_proc.data(i,2)-37;
    category = train_befor_proc.textdata{i+1,2};
    %%%%%%%%%%%%%%%%%%%%%%%%处理年月日以及小时%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    train_after_proc(i,1) = Dates(1,1:4);
    if Dates(1,7)=='/'
        train_after_proc(i,2) = Dates(1,6);
        if Dates(1,9)==' '
            train_after_proc(i,3) = Dates(1,8);
            if Dates(1,11)==':'
                train_after_proc(i,4) = Dates(1,10);
            else
                train_after_proc(i,4) = Dates(1,10:11);
            end
        else
            train_after_proc(i,3) = Dates(1,8:9);
            if Dates(1,12)==':'
                train_after_proc(i,4) = Dates(1,11);
            else
                train_after_proc(i,4) = Dates(1,11:12);
            end
        end
    else 
        train_after_proc(i,2) = Dates(1,6:7);
        if Dates(1,10)==' '
            train_after_proc(i,3) = Dates(1,9);
            if Dates(1,12)==':'
                train_after_proc(i,4) = Dates(1,11);
            else
                train_after_proc(i,4) = Dates(1,11:12);
            end
        else
            train_after_proc(i,3) = Dates(1,9:10);
            if Dates(1,13)==':'
                train_after_proc(i,4) = Dates(1,12);
            else
                train_after_proc(i,4) = Dates(1,12:13);
            end
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%处理DayOfWeek%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%如果是星期一，则序号为1%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%以此类推%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    train_after_proc(i,5)=DayOfWeek;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%处理PdDistrict%%%%%%%%%%%%%%%%%%%%%%%%%%
    train_after_proc(i,6)=PdDistrict;   
    %%%%%统计经纬度%%%%%%%%%%%%%%%
    train_after_proc(i,7)=X;
    train_after_proc(i,8)=Y;
    %%%%%%统计犯罪类别%%%%%%%%%%%%
    train_after_proc(i,9)=category;
    
%   save peocessed_Data 'train_after_proc';


