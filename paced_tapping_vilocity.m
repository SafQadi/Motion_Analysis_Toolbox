% The function paced_tapping_vilocity loads the paced_tapping
% -ascii-file, performs the pre-prossing steps (interpolation, 
% and baseline correction) and  returns the 
% data series (time and signal values) to be anaylized and plotted
% in the paced_tapping GUI.

% Program :  Motion-Analysis 
% Version :  1.
% Function:  paced_tapping_vilocity
% Author  :  Dr. Safwan Al-Qadhi


function [Time,sg]=paced_tapping_vilocity(varargin)

comp=varargin{1};

H=importdata(comp); % Patient

[ok]=file_control(H);

if ok==1;
    
Time=H.data(:,1);
sig=H.data(:,2);

sig= interp1(Time,sig,Time,'cubic');   % Interpolation of NaN points  

sg=sig-mean(sig);

% windowSize = 3;
% sg=filter(ones(1,windowSize)/windowSize,1,sg);     % running average

% fs=50;		                          % Sampling rate
% filterOrder=3;		                  % Order of filter
% cutOffFreq=[0.5 8];                   % Cutoff frequency
% [b, a]=butter(filterOrder, cutOffFreq/(fs/2));
% sig1=filter(b,a,sig);
% 
% sg_Hand_Tapping_HPF=sig1;    

else
    Time='';
    sg='';
    return
end 