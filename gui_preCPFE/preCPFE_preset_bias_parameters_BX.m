% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
function preCPFE_preset_bias_parameters_BX
%% Function to set valid inputs for bias parameters
% author: d.mercier@mpie.de

preCPFE_set_CPFEM_solver;

gui_BX = guidata(gcf);

if strfind(gui_BX.config.CPFEM.fem_solver_used, 'Abaqus')
    set(gui_BX.handles.mesh.box_bias_x_val, 'String', num2str(gui_BX.defaults.variables.box_bias_x_abaqus));
    set(gui_BX.handles.mesh.box_bias_x_str, 'String', 'box_bias_x (>= 1)');
    
    set(gui_BX.handles.mesh.box_bias_z_val, 'String', num2str(gui_BX.defaults.variables.box_bias_z_abaqus));
    set(gui_BX.handles.mesh.box_bias_z_str, 'String', 'box_bias_z (>= 1)');
    
    set(gui_BX.handles.mesh.box_bias_y1_val, 'String', num2str(gui_BX.defaults.variables.box_bias_y1_abaqus));
    set(gui_BX.handles.mesh.box_bias_y1_str, 'String', 'box_bias_y1 (>= 1)');
    
    set(gui_BX.handles.mesh.box_bias_y2_val, 'String', num2str(gui_BX.defaults.variables.box_bias_y2_abaqus));
    set(gui_BX.handles.mesh.box_bias_y2_str, 'String', 'box_bias_y2 (>= 1)');
    
    set(gui_BX.handles.mesh.box_bias_y3_val, 'String', num2str(gui_BX.defaults.variables.box_bias_y3_abaqus));
    set(gui_BX.handles.mesh.box_bias_y3_str, 'String', 'box_bias_y3 (>= 1)');
    
elseif strfind(gui_BX.config.CPFEM.fem_solver_used, 'Mentat')
    set(gui_BX.handles.mesh.box_bias_x_val, 'String', num2str(gui_BX.defaults.variables.box_bias_x_mentat));
    set(gui_BX.handles.mesh.box_bias_x_str, 'String', 'box_bias_x (-0.5 to 0.5)');
    
    set(gui_BX.handles.mesh.box_bias_z_val, 'String', num2str(gui_BX.defaults.variables.box_bias_z_mentat));
    set(gui_BX.handles.mesh.box_bias_z_str, 'String', 'box_bias_z (-0.5 to 0.5)');
    
    set(gui_BX.handles.mesh.box_bias_y1_val, 'String', num2str(gui_BX.defaults.variables.box_bias_y1_mentat));
    set(gui_BX.handles.mesh.box_bias_y1_str, 'String', 'box_bias_y1 (-0.5 to 0.5)');
    
    set(gui_BX.handles.mesh.box_bias_y2_val, 'String', num2str(gui_BX.defaults.variables.box_bias_y2_mentat));
    set(gui_BX.handles.mesh.box_bias_y2_str, 'String', 'box_bias_y2 (-0.5 to 0.5)');
    
    set(gui_BX.handles.mesh.box_bias_y3_val, 'String', num2str(gui_BX.defaults.variables.box_bias_y3_mentat));
    set(gui_BX.handles.mesh.box_bias_y3_str, 'String', 'box_bias_y3 (-0.5 to 0.5)');
end

end