function test_after_proc=load_test_by_year(test_file)
test_befor_proc=importdata(test_file);
[row,col]=size(test_befor_proc.textdata);
% ����һ��row*9�ľ��󣬳�ʼ���þ���ȫΪ0
%�þ����ÿһά�ֱ��ǣ�
%year,month,date,hour,days of week,PdDistrict,X,Y,category
test_after_proc=zeros(row-1,9);

%ѭ������
for i=1:row-1
    ID = test_befor_proc.textdata{i+1,1};
    Dates = test_befor_proc.textdata{i+1,2};
    DayOfWeek = test_befor_proc.textdata{i+1,3};
    PdDistrict = test_befor_proc.textdata{i+1,4};
    Address = test_befor_proc.textdata{i+1,5};
    X = test_befor_proc.data(i,1)+122;
    Y = test_befor_proc.data(i,2)-37;
    %%%%%%%%%%%%%%%%%%%%%%%%�����������Լ�Сʱ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    test_after_proc(i,1)=str2double(ID);
    test_after_proc(i,2) = str2double(Dates(1,1:4));
    if Dates(1,7)=='/'
        test_after_proc(i,3) = str2double(Dates(1,6));
        if Dates(1,9)==' '
            test_after_proc(i,4) = str2double(Dates(1,8));
            if Dates(1,11)==':'
                test_after_proc(i,5) = str2double(Dates(1,10));
            else
                test_after_proc(i,5) = str2double(Dates(1,10:11));
            end
        else
            test_after_proc(i,4) = str2double(Dates(1,8:9));
            if Dates(1,12)==':'
                test_after_proc(i,5) = str2double(Dates(1,11));
            else
                test_after_proc(i,5) = str2double(Dates(1,11:12));
            end
        end
    else
        test_after_proc(i,3) = str2double(Dates(1,6:7));
        if Dates(1,10)==' '
            test_after_proc(i,4) = str2double(Dates(1,9));
            if Dates(1,12)==':'
                test_after_proc(i,5) = str2double(Dates(1,11));
            else
                test_after_proc(i,5) = str2double(Dates(1,11:12));
            end
        else
            test_after_proc(i,4) = str2double(Dates(1,9:10));
            if Dates(1,13)==':'
                test_after_proc(i,5) = str2double(Dates(1,12));
            else
                test_after_proc(i,5) = str2double(Dates(1,12:13));
            end
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%����DayOfWeek%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%���������һ�������Ϊ1%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%�Դ�����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    switch DayOfWeek
        case 'Monday'
            test_after_proc(i,6)=1;
        case 'Tuesday'
            test_after_proc(i,6)=2;
        case 'Wednesday'
            test_after_proc(i,6)=3;
        case 'Thursday'
            test_after_proc(i,6)=4;
        case 'Friday'
            test_after_proc(i,6)=5;
        case  'Saturday'
            test_after_proc(i,6)=6;
        case 'Sunday'
            test_after_proc(i,6)=7;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%����PdDistrict%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%���վ���ֽ����İ참Ƶ�ʴӸߵ���%%%%%%%%%%
    %1��RICHMOND
    %2��PARK
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
            test_after_proc(i,7)=1;
        case 'PARK'
            test_after_proc(i,7)=2;
        case 'TARAVAL'
            test_after_proc(i,7)=3;
        case 'INGLESIDE'
            test_after_proc(i,7)=4;
        case 'TENDERLOIN'
            test_after_proc(i,7)=5;
        case 'CENTRAL'
            test_after_proc(i,7)=6;
        case 'BAYVIEW'
            test_after_proc(i,7)=7;
        case 'NORTHERN'
            test_after_proc(i,7)=8;
        case 'MISSION'
            test_after_proc(i,7)=9;
        case 'SOUTHERN'
            test_after_proc(i,7)=10;
    end;
    %%%%%ͳ�ƾ�γ��%%%%%%%%%%%%%%
    test_after_proc(i,8)=X*100;
    test_after_proc(i,9)=Y*100;
    
end;
save testData 'test_after_proc';
test_data=cell(13,1);
for i =1:13
    index=find(test_after_proc(:,2)==(i+2002));
    test_data{i}=test_after_proc(index,[3:9,1]);
end
save test_data_by_year 'test_data';
end