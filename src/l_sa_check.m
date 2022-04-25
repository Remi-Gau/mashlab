function status = l_sa_check(literal, is_standalone)
    %
    % Left standalone check
    % Do a preliminary check to see if a tag could be a standalone
    %
    % USAGE::
    %
    %   status = l_sa_check(literal, is_standalone)
    %
    %
    % (C) Copyright 2022 Remi Gau

    status = true;

    % If there is a newline, or the previous tag was a standalone
    new_lines = regexp(literal, newline, 'match');
    if ~isempty(new_lines) || is_standalone

        tmp = regexp(literal, newline, 'split');
        padding = tmp{end};

        % If all the characters since the last newline are spaces
        if all(isspace(padding)) || strcmp(padding, '')
            % Then the next tag could be a standalone
            status = true;
        else
            % Otherwise it can't be
            status = false;
        end

    end

end
