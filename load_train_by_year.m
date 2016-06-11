function train_data=load_train_by_year(train_file)

CATEGORY ={'ARSON';'ASSAULT';'BAD CHECKS';'BRIBERY';'BURGLARY';'DISORDERLY CONDUCT';'DRIVING UNDER THE INFLUENCE';'DRUG/NARCOTIC';'DRUNKENNESS';'EMBEZZLEMENT';'EXTORTION';'FAMILY OFFENSES';'FORGERY/COUNTERFEITING';'FRAUD';'GAMBLING';'KIDNAPPING';'LARCENY/THEFT';
'LIQUOR LAWS';'LOITERING';'MISSING PERSON';'NON-CRIMINAL';'OTHER OFFENSES';'PORNOGRAPHY/OBSCENE MAT';'PROSTITUTION';'RECOVERED VEHICLE';'ROBBERY';'RUNAWAY';'SECONDARY CODES';'SEX OFFENSES FORCIBLE';'SEX OFFENSES NON FORCIBLE';'STOLEN PROPERTY';'SUICIDE';'SUSPICIOUS OCC';'TREA';'TRESPASS';'VANDALISM';'VEHICLE THEFT';'WARRANTS';'WEAPON LAWS';};

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
    X = train_befor_proc.data(i,1)+122;
    Y = train_befor_proc.data(i,2)-37;
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
    train_after_proc(i,7)=X*100;
    train_after_proc(i,8)=Y*100;
    %%%%%%统计犯罪类别%%%%%%%%%%%%
    c=find(strcmp(CATEGORY,category));
    train_after_proc(i,9)=c;
%     train_after_proc(i,10)=category;
end;
save train_Data 'train_after_proc';
train_after_proc=train_after_proc(find(train_after_proc(:,9)>0),:);
train_data=cell(13,1);
for i =1:13
    index=find(train_after_proc(:,1)==(i+2002));
    train_data{i}=train_after_proc(index,2:9);
end
save train_data_by_year  'train_data';
end
