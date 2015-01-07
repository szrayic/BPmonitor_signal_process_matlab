clc, clear, close all

figs = [];

%% ѡȡ���������ļ���
[filePath] = uigetdir('D:\02_MyProjects\BloodPressure\04_softwares\interface_python\BPMonitor_git\data\young', ...
    '��ѡ���������ڵ��ļ���');

filePathForSave = uigetdir(filePath, '��ѡ������Ҫ������ļ���');

formulas = {'MK-MODEL', 'POWER', 'LINEAR', 'QUADRIC'};

%% �����˶�ǰ���ź�
fileNames = {'pf.mat', 'xc.mat'};  %'sj.mat', 'xc.mat','pf.mat', 'ydh.mat'
[HRs, PWTTs, MBPs, DBPs, SBPs, corrPwttHrs, ...
    meanHR, meanPWTT, meanBP, varHR, varPWTT, varBP, ...
    corrPwttBpTotal, corrPwttHrTotal, corrBpHrTotal, figCorr] = computeAll(filePath, fileNames, '�궨����');
saveas(figCorr, [filePathForSave, '/�궨���ݣ�PWTT��BP�������'], 'fig');
set(figCorr, 'PaperPositionMode', 'auto');
saveas(figCorr, [filePathForSave, '/�궨���ݣ�PWTT��BP�������'], 'jpg');

%% ������ֹ���ı���̬�����Լ��ź�
fileNames = {'static.mat'};  %'static.mat', 'gesture.mat', 'gesture1.mat', 'bq_hs.mat', 'hs.mat'
[HRs_static, PWTTs_static, MBPs_static, DBPs_static, SBPs_static, corrPwttHrs_static, ... 
    meanHR_static, meanPWTT_static, meanBP_static, varHR_static, varPWTT_static, varBP_static, ...
    corrPwttBpTotal_static, corrPwttHrTotal_static, corrBpHrTotal_static, figCorr] = computeAll(filePath, fileNames, '��ֹ��ı���̬');
saveas(figCorr, [filePathForSave, '/��ֹ��ı���̬��PWTT��BP�������'], 'fig');
set(figCorr, 'PaperPositionMode', 'auto');
saveas(figCorr, [filePathForSave, '/��ֹ��ı���̬��PWTT��BP�������'], 'jpg');

% %% �����������Լ��ź�
% fileNames = {'bq.mat'};  %'static.mat', 'gesture.mat', 'gesture1.mat', 'bq_hx.mat', 'hs.mat'
% [HRs_bq, PWTTs_bq, MBPs_bq, DBPs_bq, SBPs_bq, corrPwttHrs_bq, ... 
%     meanHR_bq, meanPWTT_bq, meanBP_bq, varHR_bq, varPWTT_bq, varBP_bq, ...
%     corrPwttBpTotal_bq, corrPwttHrTotal_bq, corrBpHrTotal_bq, figCorr] = computeAll(filePath, fileNames, '�ı����');
% saveas(figCorr, [filePathForSave, '/�ı������PWTT��BP�������'], 'fig');
% set(figCorr, 'PaperPositionMode', 'auto');
% saveas(figCorr, [filePathForSave, '/�ı������PWTT��BP�������'], 'jpg');
% 
% %% ������ˮ���Լ��ź�
% fileNames = {'hs.mat'};  %'static.mat', 'gesture.mat', 'gesture1.mat', 'bq_hs.mat', 'hs.mat'
% [HRs_hs, PWTTs_hs, MBPs_hs, DBPs_hs, SBPs_hs, corrPwttHrs_hs, ... 
%     meanHR_hs, meanPWTT_hs, meanBP_hs, varHR_hs, varPWTT_hs, varBP_hs, ...
%     corrPwttBpTotal_hs, corrPwttHrTotal_hs, corrBpHrTotal_hs, figCorr] = computeAll(filePath, fileNames, '��ˮ');
% saveas(figCorr, [filePathForSave, '/��ˮ��PWTT��BP�������'], 'fig');
% set(figCorr, 'PaperPositionMode', 'auto');
% saveas(figCorr, [filePathForSave, '/��ˮ��PWTT��BP�������'], 'jpg');

%% �궨����֤
fig = figure('Name', ' �궨����'); 
calibrateAndPlot(MBPs, PWTTs(9, :), 'POWER');
saveas(fig, [filePathForSave, '/�궨���ݣ��궨�����Ѫѹ'], 'fig');
set(fig, 'PaperPositionMode', 'auto');
saveas(fig, [filePathForSave, '/�궨���ݣ��궨�����Ѫѹ'], 'jpg');
% �þ�ֹ������֤
[MSEs_static, MEs_static, SVEs_static, CORRs_static, figEst] = calibrateAndComputeBPwith12PWTTsAndDifferentModel...
    (MBPs, PWTTs, MBPs_static, PWTTs_static, formulas, '��ֹ��ı���̬');
saveas(figEst, [filePathForSave, '/��ֹ��ı���̬���궨�����Ѫѹ'], 'fig');
set(figEst, 'PaperPositionMode', 'auto');
saveas(figEst, [filePathForSave, '/��ֹ��ı���̬���궨�����Ѫѹ'], 'jpg');
% % �ñ���������֤
% [MSEs_bq, MEs_bq, SVEs_bq, CORRs_bq, figEst] = calibrateAndComputeBPwith12PWTTsAndDifferentModel...
%     (MBPs, PWTTs, MBPs_bq, PWTTs_bq, formulas, '�ı����');
% saveas(figEst, [filePathForSave, '/�ı�������궨�����Ѫѹ'], 'fig');
% set(figEst, 'PaperPositionMode', 'auto');
% saveas(figEst, [filePathForSave, '/�ı�������궨�����Ѫѹ'], 'jpg');
% % �ú�ˮ������֤
% [MSEs_hs, MEs_hs, SVEs_hs, CORRs_hs, figEst] = calibrateAndComputeBPwith12PWTTsAndDifferentModel...
%     (MBPs, PWTTs, MBPs_hs, PWTTs_hs, formulas, '��ˮ');
% saveas(figEst, [filePathForSave, '/��ˮ���궨�����Ѫѹ'], 'fig');
% set(figEst, 'PaperPositionMode', 'auto');
% saveas(figEst, [filePathForSave, '/��ˮ���궨�����Ѫѹ'], 'jpg');

save([filePathForSave, '/results.mat']);