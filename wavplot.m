function wavplot(wavFile)
% wavplot(wavFile) plot waveform and spectrum of wav file
% bagus@ep.its.ac.id

if nargin>1
    fprintf('Usage: wavplot(wavFile \n');
    return;
end;

[y, fs]=wavread(wavFile);
t=1/fs:1/fs:length(y)/fs;
plot(t,y)
end
