function wavplay(wavFile)
% Replace default wavplay from Mathworks
% Bagus Tris Atmaja 2015/04/11 12:47:00
% bagus@ep.its.ac.id


if nargin>1
    fprintf('wavplot(wavFile \n');
    return;
end;

[y, fs]=wavread(wavFile);
sound(y,fs)
end