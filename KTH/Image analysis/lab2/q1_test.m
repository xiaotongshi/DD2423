clear

i = linspace(-2*pi, 2*pi, 100);
y = sin(i);
figure
subplot(4,1,1)
plot( y)
title('orginal signal')
subplot(4,1,2)
y1 = diff(y);
plot( y1)
title('first derivative')
subplot(4,1,3)
y2 = diff(y1);
plot( y2)
title('second derivative')
subplot(4,1,4)
y3 = diff(y2);
plot( y3)
title('third derivative')
