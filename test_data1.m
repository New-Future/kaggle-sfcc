function test_after_proc=test_data1(old_data);

test_befor_proc=importdata(old_data);
[row,col]=size(test_befor_proc.textdata)
% 创建一个row*9的矩阵，初始化该矩阵全为0
%该矩阵的每一维分别是：
%year,month,date,hour,days of week,PdDistrict,X,Y,category
test_after_proc=zeros(row-1,6);

%循环处理
for i=1:row-1
    ID = test_befor_proc.textdata{i+1,1};
    Dates = test_befor_proc.textdata{i+1,2};
    DayOfWeek = test_befor_proc.textdata{i+1,3};
    PdDistrict = test_befor_proc.textdata{i+1,4};
    Address = test_befor_proc.textdata{i+1,5};
    X = test_befor_proc.data(i,1)+122;
    Y = test_befor_proc.data(i,2)-37;
    %%%%%%%%%%%%%%%%%%%%%%%%处理年月日以及小时%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    test_after_proc(i,1)=str2double(ID);
    test_after_proc(i,2)=datenum(Dates(1,:));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%处理DayOfWeek%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%如果是星期一，则序号为1%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%以此类推%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    switch DayOfWeek
        case 'Monday'
            test_after_proc(i,3)=1;
        case 'Tuesday'
            test_after_proc(i,3)=2;
        case 'Wednesday'
            test_after_proc(i,3)=3;
        case 'Thursday'
            test_after_proc(i,3)=4;
        case 'Friday'
            test_after_proc(i,3)=5;
        case  'Saturday'
            test_after_proc(i,3)=6;
        case 'Sunday'
            test_after_proc(i,3)=7;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%处理PdDistrict%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%按照警察局街区的办案频率从高到低%%%%%%%%%%
    %1：RICHMOND
    %2：PARK
    %3:TARAVAL
    %4:INGLESIDE
    %5:TENDERLOIN
    %6:CENTRAL
    %7:BAYVIEW
    %8:NORTHERN
    %9:MISSION
    %10:SOUTHERN
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    switch PdDistrict 
        case 'RICHMOND'
            test_after_proc(i,4)=1;
        case 'PARK'
            test_after_proc(i,4)=2;
        case 'TARAVAL'
            test_after_proc(i,4)=3;
        case 'INGLESIDE'
            test_after_proc(i,4)=4;
        case 'TENDERLOIN'
            test_after_proc(i,4)=5;
        case 'CENTRAL'
            test_after_proc(i,4)=6;
        case 'BAYVIEW'
            test_after_proc(i,4)=7;
        case 'NORTHERN'
            test_after_proc(i,4)=8;
        case 'MISSION'
            test_after_proc(i,4)=9;
        case 'SOUTHERN'           
            test_after_proc(i,4)=10;
    end;
    %%%%%统计经纬度%%%%%%%%%%%%%%
    test_after_proc(i,5)=X;
    test_after_proc(i,6)=Y;
   
end;
%   save peocessed_Data 'test_after_proc';


