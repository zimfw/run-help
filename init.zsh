unalias run-help 2>/dev/null
autoload -Uz run-help
bindkey '^[h' run-help
bindkey '^[H' run-help

local cmd
for cmd in git ip openssl p4 sudo svk svn; do
  if (( ${+commands[${cmd}]} )) autoload -Uz run-help-${cmd}
done
unset cmd
