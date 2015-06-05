% plot grafik TR
% based on equation of transmibility

col=hsv(10);

for j=1:4
    kesi=j*0.1;
    for i=1:1001
       w_wn(i)=3*(i-1)/1000;
       T(i)=sqrt((1+(2*kesi*w_wn(i))^2)/((1-w_wn(i)^2)^2+2*kesi*w_wn(i)^2));
    end
    plot(w_wn,T, 'color', col(j,:));
    hold on;
end

xlabel('r');
ylabel('Ta');
title('Grafi TR');
grid on;