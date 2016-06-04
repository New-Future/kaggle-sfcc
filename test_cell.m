function test_after_proc=test_cell(old_data);

test_befor_proc=importdata(old_data);
[row,col]=size(test_befor_proc.textdata)
% 创建一个row*9的矩阵，初始化该矩阵全为0
%该矩阵的每一维分别是：
%year,month,date,hour,days of week,PdDistrict,X,Y,category
test_after_proc=zeros(row-1,8);

%循环处理
for i=1:row-1
    Dates = test_befor_proc.textdata{i+1,2};
    DayOfWeek = test_befor_proc.textdata{i+1,3};
    PdDistrict = test_befor_proc.textdata{i+1,4};
    Address = test_befor_proc.textdata{i+1,5};
    X = test_befor_proc.data(i,1)+122;
    Y = test_befor_proc.data(i,2)-37;
    %%%%%%%%%%%%%%%%%%%%%%%%处理年月日以及小时%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    test_after_proc(i,1) = Dates(1,1:4));
    if Dates(1,7)=='/'
        test_after_proc(i,2) = Dates(1,6));
        if Dates(1,9)==' '
            test_after_proc(i,3) = Dates(1,8));
            if Dates(1,11)==':'
                test_after_proc(i,4) = Dates(1,10));
            else
                test_after_proc(i,4) = Dates(1,10:11));
            end
        else
            test_after_proc(i,3) = Dates(1,8:9));
            if Dates(1,12)==':'
                test_after_proc(i,4) = Dates(1,11));
            else
                test_after_proc(i,4) = Dates(1,11:12));
            end
        end
    else 
        test_after_proc(i,2) = Dates(1,6:7));
        if Dates(1,10)==' '
            test_after_proc(i,3) = Dates(1,9));
            if Dates(1,12)==':'
                test_after_proc(i,4) = Dates(1,11));
            else
                test_after_proc(i,4) = Dates(1,11:12));
            end
        else
            test_after_proc(i,3) = Dates(1,9:10));
            if Dates(1,13)==':'
                test_after_proc(i,4) = Dates(1,12));
            else
                test_after_proc(i,4) = Dates(1,12:13));
            end
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%处理DayOfWeek%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%如果是星期一，则序号为1%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%以此类推%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   test_after_proc(i,5)=DayOfWeek;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%处理PdDistrict%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%按照警察局街区的办案频率从高到低%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    test_after_proc(i,6)=PdDistrict;
    %%%%%统计经纬度%%%%%%%%%%%%%%
    test_after_proc(i,7)=X;
    test_after_proc(i,8)=Y;
   
end;
%   save peocessed_Data 'test_after_proc';


