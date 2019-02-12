function numericEditFieldValue
% Create UI figure and components

fig = uifigure('Position',[100 100 350 275]);

slider = uislider(fig,...
    'Position',[100 140 120 3]);

numfld = uieditfield(fig,'numeric',...
    'Position',[110 200 100 22],...
    'ValueChangedFcn',@(numfld,event) numberChanged(numfld,slider));

end

% Create ValueChangedFcn callback
function numberChanged(numfld,slider)
slider.Value = numfld.Value;
end