function [train_after_proc]=loadtrain(train_file )

train_befor_proc=importdata(train_file);
[row,col]=size(train_befor_proc.textdata);
% 创建一个row*9的矩阵，初始化该矩阵全为0
%该矩阵的每一维分别是：
%year,month,date,hour,days of week,PdDistrict,X,Y,category
train_after_proc=zeros(row-1,9);

%循环处理
for i=1:row-1
    Dates = train_befor_proc.textdata{i+1,1};
    DayOfWeek = train_befor_proc.textdata{i+1,4};
    PdDistrict = train_befor_proc.textdata{i+1,5};
    Address = train_befor_proc.textdata{i+1,7};
   X = train_befor_proc.data(i,1);%+122;
   Y = train_befor_proc.data(i,2);%-37;
    category = train_befor_proc.textdata{i+1,2};
    %%%%%%%%%%%%%%%%%%%%%%%%处理年月日以及小时%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    train_after_proc(i,1) = str2double(Dates(1,1:4));
    if Dates(1,7)=='/'
        train_after_proc(i,2) = str2double(Dates(1,6));
        if Dates(1,9)==' '
            train_after_proc(i,3) = str2double(Dates(1,8));
            if Dates(1,11)==':'
                train_after_proc(i,4) = str2double(Dates(1,10));
            else
                train_after_proc(i,4) = str2double(Dates(1,10:11));
            end
        else
            train_after_proc(i,3) = str2double(Dates(1,8:9));
            if Dates(1,12)==':'
                train_after_proc(i,4) = str2double(Dates(1,11));
            else
                train_after_proc(i,4) = str2double(Dates(1,11:12));
            end
        end
    else 
        train_after_proc(i,2) = str2double(Dates(1,6:7));
        if Dates(1,10)==' '
            train_after_proc(i,3) = str2double(Dates(1,9));
            if Dates(1,12)==':'
                train_after_proc(i,4) = str2double(Dates(1,11));
            else
                train_after_proc(i,4) = str2double(Dates(1,11:12));
            end
        else
            train_after_proc(i,3) = str2double(Dates(1,9:10));
            if Dates(1,13)==':'
                train_after_proc(i,4) = str2double(Dates(1,12));
            else
                train_after_proc(i,4) = str2double(Dates(1,12:13));
            end
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%处理DayOfWeek%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%如果是星期一，则序号为1%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%以此类推%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    switch DayOfWeek
        case 'Monday'
            train_after_proc(i,5)=1;
        case 'Tuesday'
            train_after_proc(i,5)=2;
        case 'Wednesday'
            train_after_proc(i,5)=3;
        case 'Thursday'
            train_after_proc(i,5)=4;
        case 'Friday'
            train_after_proc(i,5)=5;
        case  'Saturday'
            train_after_proc(i,5)=6;
        case 'Sunday'
            train_after_proc(i,5)=7;
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
            train_after_proc(i,6)=1;
        case 'PARK'
            train_after_proc(i,6)=2;
        case 'TARAVAL'
            train_after_proc(i,6)=3;
        case 'INGLESIDE'
            train_after_proc(i,6)=4;
        case 'TENDERLOIN'
            train_after_proc(i,6)=5;
        case 'CENTRAL'
            train_after_proc(i,6)=6;
        case 'BAYVIEW'
            train_after_proc(i,6)=7;
        case 'NORTHERN'
            train_after_proc(i,6)=8;
        case 'MISSION'
            train_after_proc(i,6)=9;
        case 'SOUTHERN'           
            train_after_proc(i,6)=10;
    end;
    %%%%%统计经纬度%%%%%%%%%%%%%%%
    train_after_proc(i,7)=X;
    train_after_proc(i,8)=Y;
    %%%%%%统计犯罪类别%%%%%%%%%%%%
    switch category
        case 'TREA'
            train_after_proc(i,9)=1;
        case 'PORNOGRAPHY/OBSCENE MAT'
            train_after_proc(i,9)=2;
        case 'GAMBLING'
            train_after_proc(i,9)=3;
        case 'SEX OFFENSES NON FORCIBLE'
            train_after_proc(i,9)=4;
        case 'EXTORTION'
            train_after_proc(i,9)=5;
        case 'BRIBERY'
            train_after_proc(i,9)=6;
        case 'BAD CHECKS'
            train_after_proc(i,9)=7;
        case 'FAMILY OFFENSES'
            train_after_proc(i,9)=8;
        case 'SUICIDE'
            train_after_proc(i,9)=9;
        case 'EMBEZZLEMENT'
            train_after_proc(i,9)=10;
        case 'LOITERING'
            train_after_proc(i,9)=11;
        case 'ARSON'
            train_after_proc(i,9)=12;
        case 'LIQUOR LAWS'
            train_after_proc(i,9)=13;
        case 'RUNAWAY'
            train_after_proc(i,9)=14;
        case 'DRIVING UNDER THE INFLUENCE'
            train_after_proc(i,9)=15;
        case 'KIDNAPPING'
            train_after_proc(i,9)=16;
        case 'RECOVERED VEHICLE'
            train_after_proc(i,9)=17;
        case 'DRUNKENNESS'
            train_after_proc(i,9)=18;
        case 'DISORDERLY CONDUCT'
            train_after_proc(i,9)=19;
        case 'SEX OFFENSES FORCIBLE'
            train_after_proc(i,9)=20;
        case 'STOLEN PROPERTY'
            train_after_proc(i,9)=21;
        case 'TRESPASS'
            train_after_proc(i,9)=22;
        case 'PROSTITUTION'
            train_after_proc(i,9)=23;
        case 'WEAPON LAWS'
            train_after_proc(i,9)=24;
        case 'SECONDARY CODES'
            train_after_proc(i,9)=25;
        case 'FORGERY/COUNTERFEITING'
            train_after_proc(i,9)=26;
        case 'FRAUD'
            train_after_proc(i,9)=27;
        case 'ROBBERY'
            train_after_proc(i,9)=28;
        case 'MISSING PERSON'
            train_after_proc(i,9)=29;
        case 'SUSPICIOUS OCC'
            train_after_proc(i,9)=30;
        case 'BURGLARY'
            train_after_proc(i,9)=31;
        case 'WARRANTS'
            train_after_proc(i,9)=32;
        case 'VANDALISM'
            train_after_proc(i,9)=33;
        case 'VEHICLE THEFT'
            train_after_proc(i,9)=34;
        case 'DRUG/NARCOTIC'
            train_after_proc(i,9)=35;
        case 'ASSAULT'
            train_after_proc(i,9)=36;
        case 'NON-CRIMINAL'
            train_after_proc(i,9)=37;
        case 'OTHER OFFENSES'
            train_after_proc(i,9)=38;
        case 'LARCENY/THEFT'
            train_after_proc(i,9)=39;
    end;
end;
  save peocessed_Data 'train_after_proc';


