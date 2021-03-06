% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
function preCPFE_generate_CPFE_model()
%% Function to run a specific GUI

% author: c.zambaldi@mpie.de

gui = guidata(gcf);

% Withdraw indenter for getting the faces in the correct height
set(gui.handles.indenter.h_indent_str, 'Value', 0);
preCPFE_set_indenter;

if (~isempty(strfind(gui.description, 'single crystal')) & isempty(strfind(gui.description, 'Scratch')))
    preCPFE_generate_indentation_model_SX;
elseif (~isempty(strfind(gui.description, 'single crystal')) & ~isempty(strfind(gui.description, 'Scratch'))) ...
        | strfind(gui.description, 'bicrystal')
    preCPFE_generate_indentation_model_BX;
end

end