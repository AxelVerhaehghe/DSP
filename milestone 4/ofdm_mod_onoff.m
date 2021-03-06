function [ofdm,paddingSize] = ofdm_mod_onoff(qamSignal,frameSize,prefixLength,usableFreqs,trainblock,Lt)
%OFDM_MOD applies a OFDM to the given QAM input signal.
%INPUT:
% - qamSignal:      The input signal modulated with QAM
% - frameSize:      The size of the DFT
% - prefixLength:   The length of the cyclic prefix
% - usableFreqs:    List of all the frequencies where SNR is
%                   high enough
% - trainblock:     Known bitstream used for channel estimation
% - Lt:             Amount of training packets per block
%
%OUTPUT:
% - ofdm:           OFDM modulated version of the input stream
% - paddingSize:    The amount of zeros added to the QAM signal to make it
%                   divisible into packets of length frameSize

    qamSignal = reshape(qamSignal,1,[]); % Making sure input is a row vector
    nbUsableFreqs = length(usableFreqs);
    signalLength   = length(qamSignal);
    dftSize  = 2*frameSize+2;   
    
    % padding input with zeros
    remainder = mod(signalLength,nbUsableFreqs);
    if remainder == 0
        remainder = nbUsableFreqs;
    end
    paddingSize = nbUsableFreqs - remainder;
    padding = zeros(1,paddingSize);
    paddedQamSignal = [qamSignal,padding];
    numFrames = length(paddedQamSignal)/nbUsableFreqs;
    
    parallel = reshape(paddedQamSignal,nbUsableFreqs,numFrames);
    
    trainblock = reshape(trainblock,[],1);
    
    temp = zeros(frameSize,Lt + numFrames);
    for j = 1:Lt
        temp(:,j) = trainblock;
    end
    for k = 1:nbUsableFreqs
        temp(usableFreqs(k),Lt+1:Lt + numFrames) = parallel(k,:);
    end
        
    without_pre = [zeros(1,numFrames + Lt);temp;zeros(1,numFrames + Lt);flipud(conj(temp))];
    without_pre_time = ifft(without_pre); %apply ifft
    ofdm = [without_pre_time(dftSize-prefixLength+1:dftSize,:);without_pre_time]; %add cyclic prefix of length L
    ofdm = ofdm(:).'; %reshapes the array into a column vector and then applies transpose
end