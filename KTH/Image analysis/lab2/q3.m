clear
pic = godthem256;
figure(1)
showgrey(pic);
title('orginal picture');
smotpic = discgaussfft(pic,1);
gradmagnpic = sqrt(Lv(pic));
gradmagnsmotpic = sqrt(Lv(smotpic));
figure(2)
subplot(1,2,1)
histogram(gradmagnpic)
axis([0 100 1 25000])
subplot(1,2,2)
histogram(gradmagnsmotpic)
axis([0 100 1 25000])
threshold = 20;
figure(3)
subplot(1,2,1)
showgrey((gradmagnpic-threshold) > 0)
subplot(1,2,2)
showgrey((gradmagnsmotpic-threshold) > 0)