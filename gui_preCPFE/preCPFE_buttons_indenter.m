% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
function handles = preCPFE_buttons_indenter(x0, hu, wu)
%% Function to create buttons to set indenter
% x0: origin of x coordinate
% hu: heigth unit
% wu: width unit

% authors: d.mercier@mpie.de

parent = gcf;

gui = guidata(gcf);

if strcmp(gui.GB.active_data, 'SX') == 1
    callback_model = 'preCPFE_indentation_setting_SX';
elseif strcmp(gui.GB.active_data, 'BX') == 1
    callback_model = 'preCPFE_indentation_setting_BX';
end

%% Pop-up menu to set the indenter
handles.pm_indenter = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Position', [22*x0 hu*19 wu*3 hu*0.9],...
    'Style', 'popup',...
    'String', {'Sphero-Conical Indenter'; 'Berkovich Indenter'; ...
    'Vickers indenter'; 'Cube Corner'; 'Flat Punch'; 'AFM topography'},...
    'BackgroundColor', [0.9 0.9 0.9],...
    'FontWeight', 'bold',...
    'FontSize', 10,...
    'HorizontalAlignment', 'center',...
    'Value', 1,...
    'Callback', strcat(('gui = guidata(gcf); set(gui.handles.indenter.rotate_loaded_indenter, ''Value'', 0); preCPFE_set_indenter;'), callback_model));

%% Pop-up menu to set the indenter properties
[handles.coneAngle_str, handles.coneAngle_val] = ...
    preCPFE_set_inputs_boxes({'Full Angle of conical indenter (�)'}, ...
    [22*x0 hu*18.7 wu*3 hu*0.5], gui.defaults.variables.coneAngle, ...
    callback_model);

[handles.tipRadius_str, handles.tipRadius_val] = ...
    preCPFE_set_inputs_boxes({'Tip radius of indenter (�m)'}, ...
    [22*x0 hu*18.1 wu*3 hu*0.5], gui.defaults.variables.tipRadius, ...
    callback_model);

[handles.h_indent_str,  handles.h_indent_val]  = ...
    preCPFE_set_inputs_boxes({'Indentation depth (�m)'}, ...
    [22*x0 hu*17.5 wu*3 hu*0.5], gui.defaults.variables.h_indent, ...
    callback_model);

%% Pop-up menu to set the mesh for AFM topography of indenter
handles.pm_indenter_mesh_quality = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Position', [22*x0 hu*16.9 wu*3 hu*0.5],...
    'Style', 'popup',...
    'String', {'Indenter - Very coarse mesh'; 'Indenter - Coarse mesh';...
    'Indenter - Fine mesh'; 'Indenter - Very fine mesh';....
    'Indenter - Ultra fine mesh'},...
    'BackgroundColor', [0.9 0.9 0.9],...
    'FontWeight', 'bold',...
    'FontSize', 10,...
    'HorizontalAlignment', 'center',...
    'Value', 3,...
    'visible', 'off',...
    'Callback', callback_model);

%% Slide bar to rotate indenter
handles.rotate_loaded_indenter_str = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Position', [22*x0 hu*16.2 wu*3 hu*0.5],...
    'Style', 'text',...
    'String', 'Rotation of the indenter (from 0 to 360�)',...
    'BackgroundColor', [0.9 0.9 0.9],...
    'HorizontalAlignment', 'center',...
    'FontSize', 10,...
    'visible', 'off');

handles.rotate_loaded_indenter = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'slider',...
    'Min', 0, 'Max', 360, 'Value', 0,...
    'Position', [22*x0 hu*15.6 wu*3 hu*0.5],...
    'visible', 'off',...
    'Callback', callback_model);

handles.rotate_loaded_indenter_box = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'BackgroundColor', [0.9 0.9 0.9],...
    'Position', [22*x0+3.01*wu hu*15.6 wu*0.75 hu*0.5],...
    'String', 0,...
    'Style', 'text',...
    'Visible', 'off');

handles.rotate_loaded_indenter_unit = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Position', [22*x0+3.77*wu hu*15.6 wu*0.25 hu*0.5],...
    'Style', 'text',...
    'String', '�',...
    'BackgroundColor', [0.9 0.9 0.9],...
    'HorizontalAlignment', 'center',...
    'FontSize', 10,...
    'visible', 'off');

end