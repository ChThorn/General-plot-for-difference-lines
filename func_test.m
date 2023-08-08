clc;clear all;close all;

%---------------Simulation ------------------
Data = 'D:\20220920 new project\ISC_3rd_design\SimulationData_WavePort_50ohm\';
DUT = sparameters(fullfile(Data,'DUT.s2p'));
Line1 = sparameters(fullfile(Data,'Line1.s2p'));
Line2 = sparameters(fullfile(Data,'Line2.s2p'));
Thru = sparameters(fullfile(Data,'Thru.s2p'));
Reflect = sparameters(fullfile(Data,'Reflect.s2p'));
MTRL = sparameters(fullfile(Data,'M_TRL_w_wp_50ohm.s2p'));
De_emb = sparameters(fullfile(Data,'deembeded_w_wp_50ohm.s2p'));

FreqG = DUT.Frequencies;
Freq = FreqG./1e9;

[MagdBDUT_S21,~,MagdBDUT_S11,~] = DUT_structure(DUT);
[MagdBLine1_S21,~,MagdBLine1_S11,~] = DUT_structure(Line1);
[MagdBLine2_S21,~,MagdBLine2_S11,~] = DUT_structure(Line2);
[MagdBThru_S21,~,MagdBThru_S11,~] = DUT_structure(Thru);
[MagdBReflect_S21,~,MagdBReflect_S11,~] = DUT_structure(Reflect);
[~,MagdBReflect_S12,~,MagdBReflect_S22] = DUT_structure(Reflect);
[MagdBMTRL_S21,~,MagdBMTRL_S11,~] = DUT_structure(MTRL);
[MagdBDeemb_S21,~,MagdBDeemb_S11,~] = DUT_structure(De_emb);


figure;
plot(Freq,MagdBDUT_S21,'-*r','MarkerIndices',1:10:length(MagdBDUT_S21),'LineWidth',2);hold on;
plot(Freq,MagdBDUT_S11,'-ok','MarkerIndices',1:10:length(MagdBDUT_S11),'LineWidth',2);hold on;
xlabel('Frequency [GHz]');
ylabel('Magnitude [dB]');
ylim([-50 0]);
yticks(-50:5:0);
xlim([0 67]);
lg1 = legend('S21','S11','Location','best');
title('Magnitude for DUT');
set(gca,'FontName','Times New Roman','FontSize',14);
grid on;
box on;

figure;
plot(Freq,MagdBLine1_S21,'-*r','MarkerIndices',1:10:length(MagdBLine1_S21),'LineWidth',2);hold on;
plot(Freq,MagdBLine1_S11,'-ok','MarkerIndices',1:10:length(MagdBLine1_S11),'LineWidth',2);hold on;
xlabel('Frequency [GHz]');
ylabel('Magnitude [dB]');
ylim([-50 0]);
yticks(-50:5:0);
xlim([0 67]);
lg2 = legend('S21','S11','Location','best');
title('Magnitude for Line1');
set(gca,'FontName','Times New Roman','FontSize',14);
grid on;
box on;

figure;
plot(Freq,MagdBLine2_S21,'-*r','MarkerIndices',1:10:length(MagdBLine2_S21),'LineWidth',2);hold on;
plot(Freq,MagdBLine2_S11,'-ok','MarkerIndices',1:10:length(MagdBLine2_S11),'LineWidth',2);hold on;
xlabel('Frequency [GHz]');
ylabel('Magnitude [dB]');
ylim([-50 0]);
yticks(-50:5:0);
xlim([0 67]);
lg3 = legend('S21','S11','Location','best');
title('Magnitude for Line2');
set(gca,'FontName','Times New Roman','FontSize',14);
grid on;
box on;

figure;
plot(Freq,MagdBThru_S21,'-*r','MarkerIndices',1:10:length(MagdBThru_S21),'LineWidth',2);hold on;
plot(Freq,MagdBThru_S11,'-ok','MarkerIndices',1:10:length(MagdBThru_S11),'LineWidth',2);hold on;
xlabel('Frequency [GHz]');
ylabel('Magnitude [dB]');
ylim([-50 0]);
yticks(-50:5:0);
xlim([0 67]);
lg4 = legend('S21','S11','Location','best');
title('Magnitude for Thru');
set(gca,'FontName','Times New Roman','FontSize',14);
grid on;
box on;

figure;
plot(Freq,MagdBReflect_S21,'-*r','MarkerIndices',1:10:length(MagdBReflect_S21),'LineWidth',2);hold on;
plot(Freq,MagdBReflect_S12,'-.g','MarkerIndices',1:10:length(MagdBReflect_S12),'LineWidth',2);hold on;
plot(Freq,MagdBReflect_S11,'-ok','MarkerSize',4,'MarkerIndices',1:10:length(MagdBReflect_S11),'LineWidth',2);hold on;
plot(Freq,MagdBReflect_S22,'-b','MarkerIndices',1:10:length(MagdBReflect_S22),'LineWidth',2);hold on;
xlabel('Frequency [GHz]');
ylabel('Magnitude [dB]');
% ylim([-100 100]);
% yticks(-100:20:100);
xlim([0 67]);
lg5 = legend('S21','S12','S11','S22','Location','best');
title('Magnitude for Reflect');
set(gca,'FontName','Times New Roman','FontSize',14);
grid on;
box on;

figure;
plot(Freq,MagdBDUT_S21,'-*r','MarkerIndices',1:20:length(MagdBDUT_S21),'LineWidth',2);hold on;
plot(Freq,MagdBLine1_S21,'-hexagram','Markersize',5,'Color','b','MarkerIndices',1:10:length(MagdBLine1_S21),'LineWidth',2);hold on;
plot(Freq,MagdBLine2_S21,'-.k','MarkerIndices',1:10:length(MagdBLine2_S21),'LineWidth',2);hold on;
plot(Freq,MagdBThru_S21,'-m','MarkerIndices',1:10:length(MagdBThru_S21),'LineWidth',2);hold on;
xlabel('Frequency [GHz]');
ylabel('S21 [dB]');
ylim([-14 0]);
yticks(-14:1:0);
xlim([0 67]);
lg6 = legend('DUT','Line1','Line2','Thru','Location','best');
title('Magnitude for all standard');
set(gca,'FontName','Times New Roman','FontSize',14);
grid on;
box on;

figure;
plot(Freq,MagdBDUT_S11,'-*r','MarkerIndices',1:20:length(MagdBDUT_S11),'LineWidth',2);hold on;
plot(Freq,MagdBLine1_S11,'-hexagram','Markersize',5,'Color','b','MarkerIndices',1:10:length(MagdBLine1_S11),'LineWidth',2);hold on;
plot(Freq,MagdBLine2_S11,'-.k','MarkerIndices',1:10:length(MagdBLine2_S11),'LineWidth',2);hold on;
plot(Freq,MagdBThru_S11,'-m','MarkerIndices',1:10:length(MagdBThru_S11),'LineWidth',2);hold on;
xlabel('Frequency [GHz]');
ylabel('S11 [dB]');
% ylim([-14 0]);
% yticks(-14:1:0);
xlim([0 67]);
lg7 = legend('DUT','Line1','Line2','Thru','Location','best');
title('Magnitude for all standard');
set(gca,'FontName','Times New Roman','FontSize',14);
grid on;
box on;
%---------------------------------Calibration-------------------
figure;
plot(Freq,MagdBDUT_S21,'-.k','MarkerIndices',1:15:length(MagdBDUT_S21),'LineWidth',2);hold on;
plot(Freq,MagdBMTRL_S21,'-hexagram','Markersize',5,'Color','b','MarkerIndices',1:10:length(MagdBMTRL_S21),'LineWidth',2);hold on;
plot(Freq,MagdBDeemb_S21,'-m','MarkerIndices',1:10:length(MagdBDeemb_S21),'LineWidth',2);hold on;
xlabel('Frequency [GHz]');
ylabel('S21 [dB]');
ylim([-12 7]);
yticks(-12:1:7);
xlim([0 67]);
lg8 = legend('DUT','M-TRL','De-embedding','Location','best');
title('Calibrated simulation ({\color{red}w/ connector})');
set(gca,'FontName','Times New Roman','FontSize',14);
grid on;
box on;

figure;
plot(Freq,MagdBDUT_S11,'-.k','MarkerIndices',1:15:length(MagdBDUT_S21),'LineWidth',2);hold on;
plot(Freq,MagdBMTRL_S11,'-hexagram','Markersize',5,'Color','b','MarkerIndices',1:10:length(MagdBMTRL_S21),'LineWidth',2);hold on;
plot(Freq,MagdBDeemb_S11,'-m','MarkerIndices',1:10:length(MagdBDeemb_S21),'LineWidth',2);hold on;
xlabel('Frequency [GHz]');
ylabel('S11 [dB]');
ylim([-70 0]);
% yticks(-14:1:0);
xlim([0 67]);
lg9 = legend('DUT','M-TRL','De-embedding','Location','best');
title('Calibrated simulation ({\color{red}w/ connector})');
set(gca,'FontName','Times New Roman','FontSize',14);
grid on;
box on;



%----------------------Function------------------

function [MagdB_S21,MagdB_S12,MagdB_S11,MagdB_S22] = DUT_structure(dut)
    
    S21_RnIm = rfparam(dut,2,1);
    S12_RnIm = rfparam(dut,1,2);
    S11_RnIm = rfparam(dut,1,1);
    S22_RnIm = rfparam(dut,2,2);
    MagdB_S21 = 20*log10(abs(S21_RnIm));
    MagdB_S12 = 20*log10(abs(S12_RnIm));
    MagdB_S11 = 20*log10(abs(S11_RnIm));
    MagdB_S22 = 20*log10(abs(S22_RnIm));

end

