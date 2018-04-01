function curves = extractedge(inpic, scale, threshold, shape)
if (nargin < 4) 
    shape = 'same';
end

lv = Lv(inpic, shape);
Lvv = Lvvtilde(discgaussfft(inpic, scale), shape);
Lvvv = Lvvvtilde(discgaussfft(inpic, scale), shape);
Lv_mask = (lv > threshold)-0.5;
Lvvv_mask = (Lvvv < 0)-0.5 ;

% sort zerocrossings with negative Lvvv and Lv above threshold
curves = zerocrosscurves(Lvv, Lvvv_mask);
curves = thresholdcurves(curves, Lv_mask);
figure
overlaycurves(inpic, curves);
