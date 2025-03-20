function shannon_fano(probabilities, symbols)
    % Sort symbols based on descending probabilities
    [sorted_probs, sorted_syms] = sort_symbols(probabilities, symbols);
    
    % Generate Shannon-Fano Codes
    codes = shannon_fano_recursive(sorted_probs, '');
    
    % Display results
    fprintf('\nSymbol | Probability | Shannon-Fano Code\n');
    fprintf('--------------------------------------\n');
    for i = 1:length(sorted_syms)
        fprintf('   %s    |    %.4f    |    %s\n', sorted_syms{i}, sorted_probs(i), codes{i});
    end
end

function [sorted_probs, sorted_syms] = sort_symbols(probabilities, symbols)
    [sorted_probs, order] = sort(probabilities, 'descend');
    sorted_syms = symbols(order);
end

function codes = shannon_fano_recursive(probabilities, prefix)
    n = length(probabilities);
    codes = cell(n, 1);
    
    if n == 1
        codes{1} = prefix;
        return;
    end
    
    % Find partition index
    total = sum(probabilities);
    cumulative = 0;
    splitIndex = 0;
    for i = 1:n
        cumulative = cumulative + probabilities(i);
        if cumulative >= total / 2
            splitIndex = i;
            break;
        end
    end
    
    % Recursively assign codes
    left_codes = shannon_fano_recursive(probabilities(1:splitIndex), [prefix '0']);
    right_codes = shannon_fano_recursive(probabilities(splitIndex+1:end), [prefix '1']);
    
    % Combine results correctly
    codes(1:splitIndex) = left_codes;
    codes(splitIndex+1:end) = right_codes;
end

% Example usage
probabilities = [0.5, 0.2, 0.2, 0.05, 0.05];
symbols = {'A', 'B', 'C', 'D', 'E'};
shannon_fano(probabilities, symbols);
