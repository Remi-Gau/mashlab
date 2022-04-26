function test_suite = test_get_key %#ok<*STOUT>
    %
    % (C) Copyright 2022 Remi Gau

    try % assignment of 'localfunctions' is necessary in Matlab >= 2016
        test_functions = localfunctions(); %#ok<*NASGU>
    catch % no problem; early Matlab versions can use initTestSuite fine
    end

    initTestSuite;

end

function test_get_key_dot()
  
  % GIVEN
  warn = false;
  keep = false;
  l_del = '{{';
  r_del = '}}';
  key = '.';
  scopes = {struct('foo', 1);
            struct('bar', 2)};
          
          % WHEN
  value = get_key(key, scopes, warn, keep, l_del, r_del);
  
    % THEN
  assertEqual(value,  struct('foo', 1))
  
end

function test_get_key_value()
  
  % GIVEN
  warn = false;
  keep = false;
  l_del = '{{';
  r_del = '}}';
  key = 'bar';
  scopes = {struct('foo', 1);
            struct('bar', 2)};
          
          % WHEN
  value = get_key(key, scopes, warn, keep, l_del, r_del);
  
    % THEN
  assertEqual(value,  2)
  
end

function test_get_key_value_nested()
  
  % GIVEN
  warn = false;
  keep = false;
  l_del = '{{';
  r_del = '}}';
  key = 'for.bar.baz.foz';
  scopes = {struct('for', struct('bar', struct('baz', struct('foz', 2))))};
  
  % WHEN
  value = get_key(key, scopes, warn, keep, l_del, r_del);
  
  % THEN
  assertEqual(value,  2)
  
end

function test_get_key_value_missing()
  
  % GIVEN
  warn = false;
  keep = false;
  l_del = '{{';
  r_del = '}}';
  key = 'for.bar.baz.foo';
  scopes = {struct('for', struct('bar', struct('baz', struct('foz', 2))))};
  
  % WHEN
  value = get_key(key, scopes, warn, keep, l_del, r_del);
  
  % THEN
  assertEqual(value,  '')
  
end