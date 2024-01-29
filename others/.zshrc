# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Fig pre block.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

### Completion
# autoload -Uz compinit && compinit  # 補完機能を有効にする
# zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
# zstyle ':completion:*' format '%B%F{blue}%d%f%b'  # 補完候補の表示形式
# zstyle ':completion:*' group-name ''  # グループ名を表示しない
# zstyle ':completion:*:default' menu select=2  # メニューを表示する

### ビープ音の停止
setopt no_beep
setopt nolistbeep  # 補完時

### Others
setopt auto_cd  # ディレクトリ名だけで移動する
setopt no_flow_control  # Ctrl-sとCtrl-qを無効化する

### asdf
. "$HOME/.asdf/asdf.sh"  # asdfを読み込む
fpath=(${ASDF_DIR}/completions $fpath)  # asdfの補完機能を有効にする

### Docker
export PATH="$PATH:/Users/usuke/.docker/bin"

### Aliases
alias ll='ls -GFl'
alias la='ls -GFla'
alias lh='ls -GFlh'
alias mem='top -o rsize'
alias cpu='top -o cpu'
alias path='echo $PATH | tr ":" "\n"'

mypdf() {
        platex $1.tex && dvipdfmx $1.dvi
    }

### Conda
__conda_setup="$('$HOME/.asdf/installs/python/anaconda3-2023.09-0/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.asdf/installs/python/anaconda3-2023.09-0/etc/profile.d/conda.sh" ]; then
        . "$HOME/.asdf/installs/python/anaconda3-2023.09-0/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.asdf/installs/python/anaconda3-2023.09-0/bin:$PATH"
    fi
fi
unset __conda_setup

### zinit
source <(curl -sL init.zshell.dev); zzinit
zinit ice depth=1; zinit light romkatv/powerlevel10k  # powerlevel10kを読み込む
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### zellij
eval "$(zellij setup --generate-auto-start zsh)"

### Fig post block.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# zprof