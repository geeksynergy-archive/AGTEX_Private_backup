% Create ValueChangedFcn callback
function numberChanged(numfld,slider)
slider.Value = numfld.Value;
end