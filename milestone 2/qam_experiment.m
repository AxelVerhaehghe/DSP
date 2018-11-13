clear();
len = 1800;
input = randi([0,1],1,len);
snr1 = 10;
snr2 = 20;

%% 4-QAM
qam2 = qam_mod(input,2); %Modulating the signal without noise (4-QAM)
qam2Noise1 = awgn(qam2,snr1,'measured'); %Adding noise to the modulated signal
qam2Noise2 = awgn(qam2,snr2,'measured');
scatterplot(qam2,1,0,'k+'); %Scatterplot of the signal without noise
scatterplot(qam2Noise1,1,0,'k+'); %Scatterplot of the signal with noise
scatterplot(qam2Noise2,1,0,'k+'); %Scatterplot of the signal with noise
output21 = qam_demod(qam2Noise1,2); %Demodulating the noisy transmitted signal
output22 = qam_demod(qam2Noise2,2);
ber21 = ber(input,output21);
fprintf(1,"BER for 4-QAM and SNR of %d = %f%%\n",snr1,100*ber21);
ber22 = ber(input,output22);
fprintf(1,"BER for 4-QAM and SNR of %d = %f%%\n",snr2,100*ber22);

%% 8-QAM
qam3 = qam_mod(input,3); %Modulating the signal without noise (4-QAM)
qam3Noise1 = awgn(qam3,snr1,'measured'); %Adding noise to the modulated signal
qam3Noise2 = awgn(qam3,snr2,'measured');
scatterplot(qam3,1,0,'b+'); %Scatterplot of the signal without noise
scatterplot(qam3Noise1,1,0,'b+'); %Scatterplot of the signal with noise
scatterplot(qam3Noise2,1,0,'b+'); %Scatterplot of the signal with noise
output31 = qam_demod(qam3Noise1,3); %Demodulating the noisy transmitted signal
output32 = qam_demod(qam3Noise2,3);
ber31 = ber(input,output31);
fprintf(1,"BER for 8-QAM and SNR of %d = %f%%\n",snr1,100*ber31);
ber32 = ber(input,output32);
fprintf(1,"BER for 8-QAM and SNR of %d = %f%%\n",snr2,100*ber32);

%% 16-QAM
qam4 = qam_mod(input,4); %Modulating the signal without noise (4-QAM)
qam4Noise1 = awgn(qam4,snr1,'measured'); %Adding noise to the modulated signal
qam4Noise2 = awgn(qam4,snr2,'measured');
scatterplot(qam4,1,0,'g+'); %Scatterplot of the signal without noise
scatterplot(qam4Noise1,1,0,'g+'); %Scatterplot of the signal with noise
scatterplot(qam4Noise2,1,0,'g+'); %Scatterplot of the signal with noise
output41 = qam_demod(qam4Noise1,4); %Demodulating the noisy transmitted signal
output42 = qam_demod(qam4Noise2,4);
ber41 = ber(input,output41);
fprintf(1,"BER for 16-QAM and SNR of %d = %f%%\n",snr1,100*ber41);
ber42 = ber(input,output42);
fprintf(1,"BER for 16-QAM and SNR of %d = %f%%\n",snr2,100*ber42);

%% 32-QAM
qam5 = qam_mod(input,5); %Modulating the signal without noise (4-QAM)
qam5Noise1 = awgn(qam5,snr1,'measured'); %Adding noise to the modulated signal
qam5Noise2 = awgn(qam5,snr2,'measured');
scatterplot(qam5,1,0,'m+'); %Scatterplot of the signal without noise
scatterplot(qam5Noise1,1,0,'m+'); %Scatterplot of the signal with noise
scatterplot(qam5Noise2,1,0,'m+'); %Scatterplot of the signal with noise
output51 = qam_demod(qam5Noise1,5); %Demodulating the noisy transmitted signal
output52 = qam_demod(qam5Noise2,5);
ber51 = ber(input,output51);
fprintf(1,"BER for 32-QAM and SNR of %d = %f%%\n",snr1,100*ber51);
ber52 = ber(input,output52);
fprintf(1,"BER for 32-QAM and SNR of %d = %f%%\n",snr2,100*ber52);

%% 64-QAM
qam6 = qam_mod(input,6); %Modulating the signal without noise (4-QAM)
qam6Noise1 = awgn(qam6,snr1,'measured'); %Adding noise to the modulated signal
qam6Noise2 = awgn(qam6,snr2,'measured');
scatterplot(qam6,1,0,'r+'); %Scatterplot of the signal without noise
scatterplot(qam6Noise1,1,0,'r+'); %Scatterplot of the signal with noise
scatterplot(qam6Noise2,1,0,'r+'); %Scatterplot of the signal with noise
output61 = qam_demod(qam6Noise1,6); %Demodulating the noisy transmitted signal
output62 = qam_demod(qam6Noise2,6);
ber61 = ber(input,output61);
fprintf(1,"BER for 64-QAM and SNR of %d = %f%%\n",snr1,100*ber61);
ber62 = ber(input,output62);
fprintf(1,"BER for 64-QAM and SNR of %d = %f%%\n",snr2,100*ber62);