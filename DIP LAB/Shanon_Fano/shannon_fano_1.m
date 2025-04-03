clc;
clear;
close all;

% Define modified data
ranges = [1 25; 26 50; 51 75; 76 100; 101 125; 126 150; 151 180; 181 255];
fq = [1800, 2200, 2000, 1900, 850, 950, 3100, 3400]; % Slightly modified frequencies
pb = fq / sum(fq);

% Sort data
[pb, id] = sort(pb, 'descend');
ranges = ranges(id, :);

% Initialize encoding
cds = cell(1, length(pb));
cum_pb = cumsum(pb);

% Shannon-Fano encoding 
for i = 1:length(pb)
    if i == 1
        cds{i} = '0';
    elseif i == length(pb)
        cds{i} = '1';
    else
        midpoint = sum(pb) / 2;
        if cum_pb(i-1) < midpoint && cum_pb(i) >= midpoint
            cds{i} = '1';
        else
            cds{i} = '0';
        end
        if mod(i, 2) == 0
            cds{i} = strcat(cds{i-1}, '0');
        else
            cds{i} = strcat(cds{i-1}, '1'); 
        end
    end
end

% Display output
for i = 1:length(cds)
    fprintf('Range: %d-%d, Code: %s\n', ranges(i, 1), ranges(i, 2), cds{i});
end
