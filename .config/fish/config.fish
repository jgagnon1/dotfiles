# Set PATH
set -gx PATH $HOME/.cargo/bin /usr/local/go/bin $PATH

# Aliases
alias vim='nvim'

# Font patching
set -g theme_nerd_fonts yes

# Bobthefish Theme Flags
set -g theme_display_docker_machine yes
set -g theme_color_scheme gruvbox

# Terraform alias
alias t terraform
alias ts tfswitch

# Kubectl alias
alias k kubectl
alias kd 'k describe'
alias kg 'k get'
alias kaf 'k apply -f'
alias kdel 'k delete'
alias ke 'k edit'
alias kccc 'k config current-context'
alias kcdc 'k config delete-context'
alias kcsc 'k config set-context'
alias kcuc 'k config use-context'
alias kdd 'kd deployment'
alias kdeld 'kdel deployment'
alias kdeli 'kdel ingress'
alias kdelp 'kdel pods'
alias kdels 'kdel svc'
alias kdelsec 'kdel secret'
alias kdi 'kd ingress'
alias kdp 'kd pods'
alias kds 'kd svc'
alias kdsec 'kd secret'
alias ked 'ke deployment'
alias kei 'ke ingress'
alias kep 'ke pods'
alias kes 'ke svc'
alias keti 'k exec -ti'
alias kgd 'kg deployment'
alias kgi 'kg ingress'
alias kgp 'kg pods'
alias kgrs 'kg rs'
alias kgs 'kg svc'
alias kgsec 'kg secret'
alias kl 'k logs'
alias klf 'k logs -f'
alias krh 'k rollout history'
alias krsd 'k rollout status deployment'
alias kru 'k rollout undo'
alias ksd 'k scale deployment'

source /usr/local/opt/asdf/asdf.fish

# Fixes macOS slow tab completion
# See https://github.com/fish-shell/fish-shell/issues/6270
if test (uname) = Darwin
  function __fish_describe_command; end
end
