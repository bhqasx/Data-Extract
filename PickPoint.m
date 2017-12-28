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


