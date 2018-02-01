%如果图片的x轴为对数坐标（以10为底），在执行该程序时，选择的第一个点应该在（1，0），
%当提示'pick two points on x axis to get xscale'时，选择图上(1,0)和(10,0)两点，提示'Input
%the difference of these two points'时输入10，最后得到的x值用10^(0.1*x)转换为真实值
%
clear all;
filename=uigetfile;
filename([1:find(filename=='.')-1])
[X,cmap]=imread(filename);
image(X);
button=questdlg('pick data points with mouse, then press Enter to continue, ensure the first point is the origin!','Guide','Yes');
if ~strcmp(button,'Yes')
    return;
end
[x,y]=ginput;
button=questdlg('pick two points on x axis to get xscale','Guide','Yes');
if ~strcmp(button,'Yes')
    return;
end
[xx,yy]=ginput;
if size(xx,1)~=2 
    msgbox('number of points picked is not correct');
    return;
end
prompt={'Input the difference of these two points'' x coordinates'};
dlg_ans=inputdlg(prompt);
xdif=str2num(dlg_ans{1});
xscale=xdif/abs(xx(2)-xx(1));

button=questdlg('pick two points on y axis to get yscale','Guide','Yes');
if ~strcmp(button,'Yes')
    return;
end
[xx,yy]=ginput;
if size(xx,1)~=2 
    msgbox('number of points picked is not correct');
    return;
end
prompt={'Input the difference of these two points'' y coordinates'};
dlg_ans=inputdlg(prompt);
ydif=str2num(dlg_ans{1});
yscale=ydif/abs(yy(1)-yy(2));

x=(x-x(1,1))*xscale;
y=(y(1,1)-y)*yscale;

plot(x,y,'b-o');
disp('check variable x and y to see the result');


