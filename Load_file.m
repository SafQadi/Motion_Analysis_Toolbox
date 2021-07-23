% The function Load_file asks the user to select a file to be loaded 
% and  gives back the location of the file. 

% Program :  Motion-Analysis 
% Version :  1.
% Function:  Load_file
% Author  :  Dr. Safwan Al-Qadhi


function [N]=Load_file()

[filename, pathname] = uigetfile('*.txt');

if isequal(filename,0)||isequal(pathname,0)
   errordlg('File is not selected','Error');
   disp('User selected Cancel');
   N='';
   return;
else
   disp(['User selected', fullfile(pathname, filename)])
   N=fullfile(pathname, filename); 
end




