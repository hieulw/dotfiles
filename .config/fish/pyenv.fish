set -gx PATH '/home/murin/.pyenv/shims' $PATH
set -gx PYENV_SHELL fish
set -gx PATH '/home/murin/.pyenv/plugins/pyenv-virtualenv/shims' $PATH;
set -gx PYENV_VIRTUALENV_INIT 1;

source '/home/murin/.pyenv/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null

function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case activate deactivate rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end

function _pyenv_virtualenv_hook --on-event fish_prompt;
  set -l ret $status
  if [ -n "$VIRTUAL_ENV" ]
    pyenv activate --quiet; or pyenv deactivate --quiet; or true
  else
    pyenv activate --quiet; or true
  end
  return $ret
end
