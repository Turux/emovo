function Hd = filtro_ch2(Fs)
%FILTRO_CH2 Returns a discrete-time filter object.

%
% MATLAB Code
% Generated by MATLAB(R) 7.14 and the Signal Processing Toolbox 6.17.
%
% Generated on: 19-Oct-2012 15:20:05
%

% Chebyshev Type II Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
%Fs = 48000;  % Sampling Frequency

Fpass = 600;         % Passband Frequency
Fstop = 900;         % Stopband Frequency
Apass = 1;           % Passband Ripple (dB)
Astop = 100;         % Stopband Attenuation (dB)
match = 'stopband';  % Band to match exactly

% Construct an FDESIGN object and call its CHEBY2 method.
h  = fdesign.lowpass(Fpass, Fstop, Apass, Astop, Fs);
Hd = design(h, 'cheby2', 'MatchExactly', match);

% [EOF]
