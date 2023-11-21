unalias run-help 2>/dev/null
autoload -Uz run-help
bindkey '^[h' run-help
bindkey '^[H' run-help

if (( ! ${+HELPDIR} )); then
  local dir
  for dir in /usr/local/share/zsh/help /usr/share/zsh/$ZSH_VERSION/help /usr/share/zsh/help; do
    if [[ -d ${dir} ]]; then
      typeset -g HELPDIR=${dir}
      break
    fi
  done
  unset dir
fi

local cmd
for cmd in git ip openssl p4 sudo svk svn; do
  if (( ${+commands[${cmd}]} )) autoload -Uz run-help-${cmd}
done
unset cmd
