% a f function which take two frequncies and decode to the  key pressed
function [key] = decoder(keys)

%new list of frequncy to hold decoded frequncy

list = [];
% DTMF low group and high group frequncies  Frequencies
original_f = [697  770  852  941  1209  1336  1477];

% loop through original frequncies of DTMF
for k=1:length(original_f)
    % if the given frequncy is arounf 5% of the orginal 
    % frequncy we take the orginal frequncy for both arrays of frequncies
    if (abs(original_f(k) - keys(1)) < 0.05 *original_f(k))
        list = [list,original_f(k)];
    elseif(abs(original_f(k) - keys(2)) < 0.05 *original_f(k))
        list = [list,original_f(k)];
    end
end
% Combination Codes with respect to the ‘original Frequncy list’
dtmf_decoder = [1 5; 1 6; 1 7; 2 5; 2 6; 2 7; 3 5; 3 6; 3 7; 4 5; 4 6; 4 7];
% Number to Key Map
key_map = ['1' '2' '3' '4' '5' '6' '7' '8' '9' '*' '0' '#'];

% return the the key which crosponds to the new frequncy 
% list from dtmf_decoder list and find the key
key = key_map(ismember(dtmf_decoder,[find(original_f==list(1)) find(original_f==list(2))],'rows'));
end
