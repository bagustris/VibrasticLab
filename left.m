% left.m : play mono on left or right channel

t = (0:44100)'./44100;
y = sin(1000 * 2 * pi * t);

% player = audioplayer(y, 44100);
% player.play();

% player = audioplayer([y, zeros(size(y))], 44100);
% player = audioplayer([zeros(size(y)), y], 44100);
play(player)