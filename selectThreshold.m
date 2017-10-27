function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    predictions = (pval < epsilon);
    
    fp = sum((predictions == 1) & (yval == 0)); % number of false positeve
    fn = sum((predictions == 0) & (yval == 1));  % number of false negative
    tp = sum((predictions == 1) & (yval == 1));   % number of ture positive
    if (tp+fp==0 || tp+fn==0) continue;
    prec = tp / (tp + fp); % precision 
    rec = tp / (tp + fn);  % recall

    F1 = 2 * prec * rec / (prec + rec); % F1 

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
