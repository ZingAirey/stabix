% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
% $Id: A_gui_plotmap.m 1120 2014-07-01 15:38:57Z d.mercier $
function interface_map_screenshots
%% Function used to generate sequential screenshots of the GUI running with given files.
% authors: d.mercier@mpie.de / c.zambaldi@mpie.de

tabularasa;
no_file = 0;

[filenameGF2, pathnameGF2] = uigetfile('.txt', 'Select the ''Grain File type 2'' file');
if filenameGF2 == 0
    filenameGF2 = '';
end
if pathnameGF2 == 0
    pathnameGF2 = '';
end

if isequal(filenameGF2, 0) || isempty(filenameGF2)
    disp('User selected Cancel');
    no_file = 1;
else
    disp(['User selected', fullfile(pathnameGF2, filenameGF2)]);
end

if ~no_file
    cd (pathnameGF2);
    [filenameRB, pathnameRB] = uigetfile('.txt', 'Select the ''Reconstructed Boundary'' file');
    if filenameRB == 0
        filenameRB = '';
    end
    if pathnameRB == 0
        pathnameRB = '';
    end
    
    if isequal(filenameRB, 0) || isempty(filenameRB)
        disp('User selected Cancel');
        no_file = 1;
    else
        disp(['User selected', fullfile(pathnameRB, filenameRB)]);
    end
    
end

if ~no_file
    % Initialization of parameters
    SCREENSHOT = 1;
    SCREENSHOT_DIR = pathnameRB;
    SCREENSHOT_NUM = 1;
    
    % Run the GUI
    A_gui_plotmap(0);
    gui = guidata(gcf);
    set(gui.handles.cbgbnum, 'Value', 0);
    interface_map_plotmap(1,1);
    xlim([ 0 20]);ylim([-20 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % Load data
    set(gui.handles.FileGF2, 'String', fullfile(filenameGF2));
    gui.config_map.filename_grain_file_type2 = filenameGF2;
    gui.config_map.pathname_grain_file_type2 = pathnameGF2;
    set(gui.handles.FileRB, 'String', fullfile(filenameRB));
    gui.config_map.filename_reconstructed_boundaries_file = filenameRB;
    gui.config_map.pathname_reconstructed_boundaries_file = pathnameRB;
    gui.flag.newDataFlag = 1;
    guidata(gcf, gui);
    set(gui.handles.Eul_title, 'BackgroundColor', [1 0 0]);
    set(gui.handles.pmcoordsyst, 'BackgroundColor', [1 0 0]);
    gui = guidata(gcf); guidata(gcf);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % Plot data
    set(gui.handles.pmcoordsyst, 'Value', 4);
    interface_map_set_coordinate_convention;
    set(gui.handles.Eul_title, 'BackgroundColor', [0.9 0.9 0.9]);
    set(gui.handles.pmcoordsyst, 'BackgroundColor', [0.9 0.9 0.9]);
    set(gui.handles.cbgbnum, 'Value', 0);
    interface_map_plotmap(1,1);
    xlim([ 0 800]);ylim([-700 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % Smoothing of GBs
    set(gui.handles.scale_gb_segments_bar, 'Value', 180);
    interface_map_plotmap(1,1);
    xlim([ 0 800]);ylim([-700 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % Increase of lattice cells size
    set(gui.handles.scale_unitcell_bar, 'Value', 2);
    interface_map_plotmap(1,1);
    xlim([ 0 800]);ylim([-700 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % Misorientation calculation
    set(gui.handles.pmparam2plot4GB, 'Value', 8);
    interface_map_plotmap(1,1);
    xlim([ 0 800]);ylim([-700 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % m' calculation for basal <a>
    set(gui.handles.pmlistslips1, 'Value', 3);
    set(gui.handles.pmparam2plot4GB, 'Value', 2);
    interface_map_plotmap(1,1);
    xlim([ 0 800]);ylim([-700 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % other calculations
    for ii = 3:1:11
        set(gui.handles.pmparam2plot4GB, 'Value', ii);
        interface_map_plotmap(1,1);
        xlim([ 0 800]);ylim([-700 0]);
        SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    end
    
    % Plot slip with highest SF
    set(gui.handles.pmparam2plot4Grains, 'Value', 2);
    interface_map_plotmap(1,1);
    xlim([ 0 800]);ylim([-700 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % m' calculation for basal <a> and prism1 <a>
    set(gui.handles.pmparam2plot4Grains, 'Value', 1);
    set(gui.handles.pmlistslips1, 'Value', [3 4]);
    set(gui.handles.pmparam2plot4GB, 'Value', 2);
    interface_map_plotmap(1,1);
    xlim([ 0 800]);ylim([-700 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % Plot slip with highest SF
    set(gui.handles.pmparam2plot4Grains, 'Value', 2);
    interface_map_plotmap(1,1);
    xlim([ 0 800]);ylim([-700 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    %Add GB numbers
    set(gui.handles.cbgbnum, 'Value', 1);
    interface_map_plotmap(1,1);
    xlim([ 0 800]);ylim([-700 0]);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    
    % Zoom on EBSD map
    zoom on;
    zoom (2.5);
    SCREENSHOT_NUM = screenshot_function(SCREENSHOT, SCREENSHOT_DIR, SCREENSHOT_NUM);
    zoom off;
end

end
