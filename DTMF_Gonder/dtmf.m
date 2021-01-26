% dtmf   function returns
% a 2x1 frequncies of given key,
% time vector of signal
% first 10ms of the time vector
% a combined sinosoid signal decoded from the given key
% first 10ms of the combined sinosoid signal decoded from the given key

function [frequncy_vector, time_vector, time_vector_of_10ms, sinosoid, sinosoid_of_10ms] = dtmf(key)

if strcmp("*",string(key))
    current_key = "10";
elseif strcmp("0",string(key))
    current_key = "11";
elseif strcmp("#",string(key))
    current_key = "12";
else
    current_key =string(key);
end

current_key = str2num(current_key);

% frequncy list of 12x2 matrix reperesenting all keys in dtmf systems in
% which row represents each key in the button
    colon_frq = [1209,1336,1477];
    row_frq = [697,770,852,941];
frequncy_list = [1,1;1,2;1,3;2,1;2,2; 2,3;3,1;3,2;3,3;4,1;4,2;4,3];

frequncies = frequncy_list(current_key,:);

%1x2 frquncy matrix  retrived by the key
frequncy_vector = [row_frq(frequncies(1)) colon_frq(frequncies(2)) ];


% Length
L = 0.3;
%sampling Frequncy
Fs = 16384;

%sampling period
dt = 1/Fs;

%time vector using sampling period
time_vector = 0:dt:L-dt;

%time vector of first 10ms
time_vector_of_10ms = 0:dt:0.01-dt;
%     sinosoid combination generated from frequncies retrived from the key
sinosoid = cos(2 * pi * frequncy_vector(1) * time_vector) + cos(2 * pi * frequncy_vector(2) * time_vector);
%    first 10ms part of orifinal sinosoid
sinosoid_of_10ms = cos(2 * pi * frequncy_vector(1) * time_vector_of_10ms) + cos(2 * pi * frequncy_vector(2) * time_vector_of_10ms);

end
