function exportPlot()
% generates the example plot from the tutorial and exports the file using
% matlab2tikz

load user_data years user1 user2
show_data(years,user1,user2);

% make sure the 'src' folder of matlab2tikz is on MATLAB's path
if ~exist('matlab2tikz','file')
    error('Please add the matlab2tikz folder to MATLAB''s path');
end

% check to see if there is a directory to save the output
if ~exist('./paperPlots','dir')
    mkdir('paperPlots');
end

% output the tikz code to a separate folder, save the data externally, and
% make the file standalone for easy compilation and viewing
matlab2tikz('./paperPlots/tikzTut.tex','externalData',true,'standalone',true);

% check to see if export_fig is on the path, if so save a copy of the
% figure
if exist('export_fig','file')
    set(gca, 'Color', 'none');
    try % this may fail if ghostscript is not installed on the machine
        export_fig('paperPlots/matlabOutput','-pdf','-png','-transparent','-painters');
    catch % default to just producing a PDF
        export_fig('paperPlots/matlabOutput','-png','-transparent','-painters');
    end
end

close all

end