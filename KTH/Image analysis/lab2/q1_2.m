clear

%%%%%%%%%%%%%q1
house = godthem256;
deltax = [-1/2,0,1/2];%central difference operator
deltay = [-1/2;0;1/2];

dxtools=conv2(house,deltax,'valid');
dytools=conv2(house,deltay,'valid');
figure(1)
subplot(1,2,1)
showgrey(dxtools)
subplot(1,2,2)
showgrey(dytools)

%%%%%%%%%%%%%%q2
dxtoolsconv = zeros(256,256);
for i=1:254
    dxtoolsconv(:,i+1) = dxtools(:,i);
end
dytoolsconv = zeros(256,256);
for i=1:254
    dytoolsconv(i+1,:) = dytools(i,:);
end
gradmagntools = sqrt(dxtoolsconv .^2 + dytoolsconv .^2);
figure(2)
subplot(1,2,1)
showgrey(gradmagntools)
title('gradient magnitude');
subplot(1,2,2)
histogram(gradmagntools)
axis([0 100 1 18000])
title('historgram of gradient magnitude');

%find the threshold
threshold=[10,20,30,40,50,60];
figure(3)
for i=1:6
    subplot(2,3,i)
    showgrey((gradmagntools - threshold(i)) > 0)
    title(['threshold = ', num2str(threshold(i))])
end

