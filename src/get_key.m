function value = get_key(key, scopes, warn, keep, l_del, r_del)
    % Get a key from the current scope
    %
    % (C) Copyright 2022 Remi Gau

    value = '';

    % If the key is a dot
    if strcmp(key,  '.')
        % Then just return the current scope
        value = scopes{1};
        return
    end

    % Loop through the scopes
    for scope = 1:numel(scopes)

        if isfield(scope, key)
            value = scope.(key);
        end

    end

    % We couldn't find the key in any of the scopes
    if isempty(value)

        if warn
            warning('Could not find key %s' key);
        end

        if keep
            value = [l_del key r_del];
        end

    end

end
