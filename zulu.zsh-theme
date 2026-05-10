# Solarized-inspired prompt, ported from the old bash_prompt.
#
# Layout (two lines):
#   <cwd> on <branch> [<status>] <wip>
#   $
#
# A trailing · inside the brackets means the working tree is dirty
# (staged, unstaged, or untracked changes).

prompt_git() {
  local s=''
  local branchName=''

  git rev-parse --is-inside-work-tree &>/dev/null || return

  # Skip dirty checks when inside .git itself.
  if [[ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" == 'false' ]]; then
    git update-index --really-refresh -q &>/dev/null

    if ! git diff --quiet --ignore-submodules --cached \
       || ! git diff-files --quiet --ignore-submodules -- \
       || [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
      s='%F{red}·%f'
    fi
  fi

  branchName="$(git symbolic-ref --quiet --short HEAD 2>/dev/null \
    || git rev-parse --short HEAD 2>/dev/null \
    || echo '(unknown)')"

  print -n " [${branchName}${s}]"
}

# Warn when the tip commit is a --wip-- (paired with a `wip`/`unwip` workflow).
work_in_progress() {
  if git log -n 1 2>/dev/null | grep -q -- '--wip--'; then
    print -n '[%F{red}wip%f]'
  fi
}

# Time the previous command; render its duration in the prompt when >= 2s.
zmodload zsh/datetime
autoload -U add-zsh-hook

_cmd_timer_start() { _cmd_timer=$EPOCHREALTIME }

_cmd_timer_stop() {
  if [[ -z "$_cmd_timer" ]]; then
    _cmd_duration=''
    return
  fi
  local elapsed=$(( EPOCHREALTIME - _cmd_timer ))
  unset _cmd_timer

  if (( elapsed < 2 )); then
    _cmd_duration=''
    return
  fi

  local int_elapsed=${elapsed%.*}
  local h=$(( int_elapsed / 3600 ))
  local m=$(( (int_elapsed / 60) % 60 ))
  local s=$(( int_elapsed % 60 ))
  local pretty

  if (( h > 0 )); then
    pretty="${h}h${m}m${s}s"
  elif (( m > 0 )); then
    pretty="${m}m${s}s"
  else
    pretty="${int_elapsed}s"
  fi

  # Pre-color so the PROMPT can splice in plain ${_cmd_duration} without
  # nested braces (which break ${var:+...} parsing).
  _cmd_duration=" %F{245}${pretty}%f"
}

add-zsh-hook preexec _cmd_timer_start
add-zsh-hook precmd  _cmd_timer_stop

setopt PROMPT_SUBST

PROMPT='%F{green}%~%f$(prompt_git)$(work_in_progress)
$%(?..%F{red}·%f) '

RPROMPT='%F{244}%m %D{%H:%M:%S}%f${_cmd_duration}'

PROMPT2='%F{yellow}→ %f'
