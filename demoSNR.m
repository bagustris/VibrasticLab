% SNR demo

Fs=2000;                        % Sampling Frequency
Fc=10;                          % Carrier Frequency
t=0:1/Fs:1;                     % define evaluation time
signal=sin(2*pi*Fc*t);          % Sample signal waveform
SNR=5;                          % SNR 5 dB will be added to signal 

% Generate Gaussian Noise with zero mean and unit variance
noise=randn(1,length(signal)); 

%Scale the input signal accordingly for the given SNR.
scaledSignal = std(noise)/std(signal)*(sqrt(10^(SNR/10)))*signal;


%calculate Signal power and noise power
signalPower = (norm(scaledSignal)^2)/length(scaledSignal);
noisePower = (norm(noise)^2)/length(noise);

%Alternative way of calculating Signal and noise power from their variance
%signalPower = var(scaledSignal);
%noisePower = var(noise);

%Calculate Signal to noise ratio for the scaledSignal and generated Noise
SNRratio = signalPower/noisePower;
measuredSNR=10*log10(SNRratio);

%Add the scaled signal with the generated noise
signalWithNoise=scaledSignal+noise;

%plotting commands
Fs=2000;                      %Sampling Frequency
Fc=10;                          % Carrier Frequency
t=0:1/Fs:1;                    % define evaluation time
signal=sin(2*pi*Fc*t);   % Sample signal waveform

%Generate Scaled signal, noise for SNR = 5dB
% Also works well for negative SNR
subplot(3,1,1);
plot(scaledSignal);
title('Input Signal');

subplot(3,1,2);
plot(noise);
title('Generated Noise');

subplot(3,1,3);
plot(signalWithNoise);
title(['Signal + Noise for SNR= ',num2str(measuredSNR),' dB']);