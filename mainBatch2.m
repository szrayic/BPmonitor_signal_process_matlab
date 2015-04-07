% close all;
%%预定义:
%采取的特征点检测方式
method = 'PEAK';
save('method.mat','method');

set(0,'DefaultFigureVisible','off');
needPlot = 0;

%选择标定数据集所在的文件夹s
disp '请选择标定数据集所在的文件夹s';
paths = uipickfiles('REFilter','\$','FilterSpec','E:\02_MyProjects\BloodPressure\04_softwares\interface_python\BPMonitor_git\data\young\');

if isempty(path)
    return
end
[BPs,PWFs] = mainBatch2getSrcData(paths,needPlot);
[coefs,errors] = linearRegression(BPs,PWFs');
disp '请选择测试数据集所在的文件夹s';
paths = uipickfiles('REFilter','\$','FilterSpec','E:\02_MyProjects\BloodPressure\04_softwares\interface_python\BPMonitor_git\data\young\');
if isempty(path)
    return
end
[BPs,PWFs] = mainBatch2getSrcData(paths,needPlot);

%评估效果
regressionErrors = evaluateRegressionEffect(BPs,coefs,PWFs');