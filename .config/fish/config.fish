# Set PATH
set -gx PATH $HOME/.cargo/bin $HOME/go/bin /usr/local/go/bin /usr/local/opt/gnu-tar/libexec/gnubin $HOME/.krew/bin $PATH 

# Aliases
alias vim='nvim'

# Font patching
set -g theme_nerd_fonts yes

# Bobthefish Theme Flags
set -g theme_display_docker_machine yes
set -g theme_color_scheme gruvbox

# Terraform alias
abbr t terraform
abbr ts tfswitch
abbr tsi 'tfswitch && terraform init'
abbr tsip 'tfswitch && terraform init && terraform plan'

test -f /usr/local/opt/asdf/asdf.fish && source /usr/local/opt/asdf/asdf.fish
test -f ~/.kubectl_aliases.fish && source ~/.kubectl_aliases.fish

# Fixes macOS slow tab completion
# See https://github.com/fish-shell/fish-shell/issues/6270
if test (uname) = Darwin
  function __fish_describe_command; end
end
