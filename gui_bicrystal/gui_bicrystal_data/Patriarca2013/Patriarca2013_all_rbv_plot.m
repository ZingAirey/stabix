% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
% $Id: Patriarca2013_all_rbv_plot.m 1100 2014-06-25 09:40:05Z d.mercier $
%% Script used to plot all Residual Burgers Vectors calculated for bicrystals given by Patriarca et al. (2013) : DOI ==> 10.1016/j.msea.2013.08.050
tabularasa;

GB(1) = load_YAML_BX_example_config_file('Patriarca2013_Gr1-Gr2_rbv0.16.yaml');
GB(2) = load_YAML_BX_example_config_file('Patriarca2013_Gr2-Gr3_rbv1.07.yaml');
GB(3) = load_YAML_BX_example_config_file('Patriarca2013_Gr2-Gr4_rbv0.38.yaml');
GB(4) = load_YAML_BX_example_config_file('Patriarca2013_Gr2-Gr6_rbv0.28.yaml');
GB(5) = load_YAML_BX_example_config_file('Patriarca2013_Gr2-Gr7_rbv1.28.yaml');
GB(6) = load_YAML_BX_example_config_file('Patriarca2013_Gr2-Gr8_rbv1.31.yaml');
GB(7) = load_YAML_BX_example_config_file('Patriarca2013_Gr3-Gr4_rbv1.14.yaml');
GB(8) = load_YAML_BX_example_config_file('Patriarca2013_Gr4-Gr5_rbv1.14.yaml');
GB(9) = load_YAML_BX_example_config_file('Patriarca2013_Gr5-Gr6_rbv0.64.yaml');
GB(10) = load_YAML_BX_example_config_file('Patriarca2013_Gr6-Gr4_rbv0.94.yaml');
GB(11) = load_YAML_BX_example_config_file('Patriarca2013_Gr7-Gr6_rbv0.18.yaml');
GB(12) = load_YAML_BX_example_config_file('Patriarca2013_Gr7-Gr8_rbv0.07.yaml');

for ig = 1:1:length(GB)
    
    rbv(ig, 1) = (residual_Burgers_vector(GB(ig).slipA_ind(2,:), GB(ig).slipB_ind(2,:), ...
        GB(ig).eulerA, GB(ig).eulerB))/2;
    
    rbv(ig, 2) = GB(ig).rbv; % Values from paper
    
    GB_legend(ig) = {strcat('G',num2str(GB(ig).GrainA),'/G',num2str(GB(ig).GrainB))};
    
end

%% Window Coordinates Configuration
scrsize = screenSize;   % Get screen size
WX = 0.27 * scrsize(3); % X Position (bottom)
WY = 0.10 * scrsize(4); % Y Position (left)
WW = 0.60 * scrsize(3); % Width
WH = 0.40 * scrsize(4); % Height

%% Plot axis setting
plot_title = mfilename;
plot_interface = figure('Name', plot_title,...
    'NumberTitle', 'off',...
    'Position', [WX WY WW WH],...
    'ToolBar', 'figure');

%% Set plot using bar
x_hist = 0.5:1:length(GB);
h_bar = bar(x_hist, rbv(:,:,:), 1);
legend(h_bar, 'Calculated values', 'Values from paper');
set(gca, 'XTick', x_hist, 'xticklabel', GB_legend);
xticklabel_rotate([],45);
ylabel('Residual Burgers Vector');
