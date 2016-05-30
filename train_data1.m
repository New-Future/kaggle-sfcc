function train_after_proc=train_data1(old_data);

train_befor_proc=importdata(old_data);
[row,col]=size(train_befor_proc.textdata)
% 创建一个row*9的矩阵，初始化该矩阵全为0
%该矩阵的每一维分别是：
%日期,days of week,PdDistrict,X,Y,category
train_after_proc=zeros(row-1,6);

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
    train_after_proc(i,1) = datenum(Dates(1,:));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%处理DayOfWeek%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%如果是星期一，则序号为1%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%以此类推%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    switch DayOfWeek
        case 'Monday'
            train_after_proc(i,2)=1;
        case 'Tuesday'
            train_after_proc(i,2)=2;
        case 'Wednesday'
            train_after_proc(i,2)=3;
        case 'Thursday'
            train_after_proc(i,2)=4;
        case 'Friday'
            train_after_proc(i,2)=5;
        case  'Saturday'
            train_after_proc(i,2)=6;
        case 'Sunday'
            train_after_proc(i,2)=7;
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
            train_after_proc(i,3)=1;
        case 'PARK'
            train_after_proc(i,3)=2;
        case 'TARAVAL'
            train_after_proc(i,3)=3;
        case 'INGLESIDE'
            train_after_proc(i,3)=4;
        case 'TENDERLOIN'
            train_after_proc(i,3)=5;
        case 'CENTRAL'
            train_after_proc(i,3)=6;
        case 'BAYVIEW'
            train_after_proc(i,3)=7;
        case 'NORTHERN'
            train_after_proc(i,3)=8;
        case 'MISSION'
            train_after_proc(i,3)=9;
        case 'SOUTHERN'           
            train_after_proc(i,3)=10;
    end;
    %%%%%统计经纬度%%%%%%%%%%%%%%%
    train_after_proc(i,4)=X;
    train_after_proc(i,5)=Y;
    %%%%%%统计犯罪类别%%%%%%%%%%%%
    switch category
        case 'TREA'
            train_after_proc(i,6)=1;
        case 'PORNOGRAPHY/OBSCENE MAT'
            train_after_proc(i,6)=2;
        case 'GAMBLING'
            train_after_proc(i,6)=3;
        case 'SEX OFFENSES NON FORCIBLE'
            train_after_proc(i,6)=4;
        case 'EXTORTION'
            train_after_proc(i,6)=5;
        case 'BRIBERY'
            train_after_proc(i,6)=6;
        case 'BAD CHECKS'
            train_after_proc(i,6)=7;
        case 'FAMILY OFFENSES'
            train_after_proc(i,6)=8;
        case 'SUICIDE'
            train_after_proc(i,6)=9;
        case 'EMBEZZLEMENT'
            train_after_proc(i,6)=10;
        case 'LOITERING'
            train_after_proc(i,6)=11;
        case 'ARSON'
            train_after_proc(i,6)=12;
        case 'LIQUOR LAWS'
            train_after_proc(i,6)=13;
        case 'RUNAWAY'
            train_after_proc(i,6)=14;
        case 'DRIVING UNDER THE INFLUENCE'
            train_after_proc(i,6)=15;
        case 'KIDNAPPING'
            train_after_proc(i,6)=16;
        case 'RECOVERED VEHICLE'
            train_after_proc(i,6)=17;
        case 'DRUNKENNESS'
            train_after_proc(i,6)=18;
        case 'DISORDERLY CONDUCT'
            train_after_proc(i,6)=19;
        case 'SEX OFFENSES FORCIBLE'
            train_after_proc(i,6)=20;
        case 'STOLEN PROPERTY'
            train_after_proc(i,6)=21;
        case 'TRESPASS'
            train_after_proc(i,6)=22;
        case 'PROSTITUTION'
            train_after_proc(i,6)=23;
        case 'WEAPON LAWS'
            train_after_proc(i,6)=24;
        case 'SECONDARY CODES'
            train_after_proc(i,6)=25;
        case 'FORGERY/COUNTERFEITING'
            train_after_proc(i,6)=26;
        case 'FRAUD'
            train_after_proc(i,6)=27;
        case 'ROBBERY'
            train_after_proc(i,6)=28;
        case 'MISSING PERSON'
            train_after_proc(i,6)=29;
        case 'SUSPICIOUS OCC'
            train_after_proc(i,6)=30;
        case 'BURGLARY'
            train_after_proc(i,6)=31;
        case 'WARRANTS'
            train_after_proc(i,6)=32;
        case 'VANDALISM'
            train_after_proc(i,6)=33;
        case 'VEHICLE THEFT'
            train_after_proc(i,6)=34;
        case 'DRUG/NARCOTIC'
            train_after_proc(i,6)=35;
        case 'ASSAULT'
            train_after_proc(i,6)=36;
        case 'NON-CRIMINAL'
            train_after_proc(i,6)=37;
        case 'OTHER OFFENSES'
            train_after_proc(i,6)=38;
        case 'LARCENY/THEFT'
            train_after_proc(i,6)=39;
    end;
end;
%   save peocessed_Data 'train_after_proc';

datestr
