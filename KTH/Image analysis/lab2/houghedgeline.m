function [ linepar, acc] = houghedgeline(pic, scale, gradmagnthreshold, nrho, ntheta, nlines, verbose)
%   pic is the grey-level image
%   scale is the scale at which edges are detected
%   gradmagnthreshold is the threshold of the gradient magnitude

curves = extractedge(pic, scale, gradmagnthreshold, 'same');
magnitude = Lv(pic, 'same');
% 
% if verbose == 1
%     figure('name', 'overlaycurves: image + edge segments')
%     overlaycurves(pic, curves);
%     figure('name', 'gradient magnitude')
%     showgrey(magnitude);
% end

[linepar, acc] = houghline(curves, magnitude, nrho, ntheta,...
    gradmagnthreshold, nlines, verbose);
figure(1)
subplot(1,2,1)
showgrey(imresize(binsepsmoothiter(acc, 0.5, 1),[362 362]));
% x=round(linepar(1,:))+362/2;
% y=round(linepar(2,:)./pi.*180+90);
% hold on;
% plot(x,y,'s','color','black');
% hold off;
title('parameter space with smoothing')
subplot(1,2,2)
visual_output(magnitude, linepar);
title('overlaycurves: magnitude + edge lines')

% if verbose == 2
%     figure('name', 'parameter space')
%     showgrey(acc);
%     figure('name', 'parameter space with smoothing')
%     showgrey(binsepsmoothiter(acc, 0.5, 1));
%     figure('name', 'overlaycurves: magnitude + edge lines')
%     visual_output(magnitude, linepar);
% end
end

