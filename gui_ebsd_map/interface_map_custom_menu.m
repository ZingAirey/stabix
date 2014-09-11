% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
function interface_map_custom_menu
%% Function to Add a custom menu item in the GUI menubar
% authors: d.mercier@mpie.de / c.zambaldi@mpie.de

gui = guidata(gcf);

menu_map = uimenu('Label', 'EBSDmap');

custom_menu_help(menu_map);

uimenu(menu_map, 'Label', 'Load EBSD map config. file', 'Callback', 'interface_map_load_YAML_config_file', 'Separator', 'on');
uimenu(menu_map, 'Label', 'Save EBSD map picture', 'Callback', 'gui = guidata(gcf); save_figure; set(gui.handles.TSLinterfWindow, ''Color'', [1 1 1]*.9);', 'Separator', 'on');
uimenu(menu_map, 'Label', 'Save results', 'Callback', 'gui = guidata(gcf); save_data(pwd, gui.GBs);');
uimenu(menu_map, 'Label', 'Show GB conventions', 'Callback', 'gui = guidata(gcf); web(fullfile(gui.config.doc_path_root, gui.config.doc_path_BXconv_png))', 'Separator', 'on');
uimenu(menu_map, 'Label', 'Edit this GUI', 'Callback', 'edit(''A_gui_plotmap'')', 'Separator', 'on');

guidata(gcf, gui);

end