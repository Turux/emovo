function [gt,int,em_n,sp_n]=set_emotion(name,name_s,database)
switch database
    case 'berlin'
emot=name(end-5);
sp=name(1:2);
         switch emot
             case 'E'
                 gt=1;
                 em_n='dis';
             case 'F'
                 gt=2;
                 em_n='gio';
             case 'N'
                 gt=3;
                 em_n='neu';
             case 'A'
                 gt=4;
                 em_n='pau';
             case 'W'
                 gt=5;
                 em_n='rab';
             case 'L'
                 gt=6;
                 em_n='noi';
             case 'T'
                 gt=7;
                 em_n='tri';
         end
         
         int=name(end-4);
         switch emot
             case 'a'
                 int=1;
             case 'b'
                 int=2
             case 'c'
                 int=3;
             case 'd'
                 int=4;
         end
         
         switch sp
             case '03'
                 sp_n=1;
             case '08'
                 sp_n=2;
             case '09'
                 sp_n=3;
             case '10'
                 sp_n=4;
             case '11'
                 sp_n=5;
             case '12'
                 sp_n=6;
             case '13'
                 sp_n=7;
             case '14'
                 sp_n=8;
             case '15'
                 sp_n=9;
             case '16'
                 sp_n=10;
         end
    case 'emovo'
        int=0;
        emot=name(1:3);
         switch emot
             case 'dis'
                 gt=1;
             case 'gio'
                 gt=2;
             case 'neu'
                 gt=3;
             case 'pau'
                 gt=4;
             case 'rab'
                 gt=5;
             case 'sor'
                 gt=6;
             case 'tri'
                 gt=7;
         end
         em_n=emot;
         sp=name_s(1:3);
         switch sp
             case 'ff1'
                 sp_n=1;
             case 'ff2'
                 sp_n=2;
             case 'ff3'
                 sp_n=3;
             case 'fm1'
                 sp_n=4;
             case 'fm2'
                 sp_n=5;
             case 'fm3'
                 sp_n=6;
         end
end
