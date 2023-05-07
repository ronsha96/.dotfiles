# Mac stuff
# TODO: move to local config
set -x LDFLAGS "-L/usr/local/opt/mysql@5.7/lib"
set -x CPPFLAGS "-I/usr/local/opt/mysql@5.7/include"
set -x ZSH "$HOME/.oh-my-zsh"

fish_add_path /usr/local/opt/mysql@5.7/bin
fish_add_path /usr/local/mysql/bin
fish_add_path /Users/ronsha/Library/Android/sdk/platform-tools/
fish_add_path /Users/ronsha/.local/bin/

alias k="kubectl"
alias ct_pods="kubectl get pods"
alias ct_port_forward="kubectl port-forward"
alias ct_rabbitmq_logs="kubectl logs -n rabbitmq -l app.kubernetes.io/component=rabbitmq,app.kubernetes.io/name=rabbitmq --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_rabbitmq_bi_logs="kubectl logs -n rabbitmq -l app.kubernetes.io/component=rabbitmq,app.kubernetes.io/name=rabbitmq-bi --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_elastic_logs="kubectl logs -n elastic -l common.k8s.elastic.co/type=elasticsearch --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_logstash_logs="kubectl logs -n elastic -l app=logstash --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_pymobiengine_logs="kubectl logs -l app=pymobiengine -c pymobiengine --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_pymobiengine_chat_logs="kubectl logs -l app=pymobiengine-chat -c pymobiengine --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_mobimanagement_logs="kubectl logs -l app=mobimanagement -c mobimanagement --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_pymobiengine_workers_logs="kubectl logs -l connecteamClass=worker -c worker --max-log-requests 100 --ignore-errors=true --follow=true"
alias ct_biengine_logs="kubectl logs -l app=biengine -c biengine --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_matrix_logs="kubectl logs -l app=matrix -c matrix --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_matrix_workers_logs="kubectl logs -l connecteamClass=matrix-worker -c matrix-worker --max-log-requests=101 --ignore-errors=true --follow=true"
alias ct_matrixapp_logs="kubectl logs -l app=matrixapp -c matrixapp --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_mongod_logs="kubectl logs -n mongo -l app.kubernetes.io/component=mongod -c mongod --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_mongos_logs="kubectl logs -n mongo -l app.kubernetes.io/component=mongos -c mongos --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_mysql_logs="kubectl logs -n vitess -c mysqld -l planetscale.com/keyspace=pymobiengine,planetscale.com/component=vttablet --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_vttablet_logs="kubectl logs -n vitess -c vttablet -l planetscale.com/keyspace=pymobiengine,planetscale.com/component=vttablet --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_vtgate_logs="kubectl logs -n vitess -l planetscale.com/component=vtgate --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_redis_leaders_logs="kubectl logs -n redis -l app=redis-leader -c redis-leader --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_redis_followers_logs="kubectl logs -n redis -l app=redis-follower -c redis-follower --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_redis_bi_leaders_logs="kubectl logs -n redis -l app=redis-bi-leader -c redis-bi-leader --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_redis_bi_followers_logs="kubectl logs -n redis -l app=redis-bi-follower -c redis-bi-follower --max-log-requests=100 --ignore-errors=true --follow=true"
alias ct_pymobiengine_shell="kubectl exec --stdin=true --tty=true pymobiengine-shell-0 -- bash"
alias ct_biengine_shell="kubectl exec --stdin=true --tty=true biengine-shell-0 -- bash"
alias ct_matrix_shell="kubectl exec --stdin=true --tty=true matrix-shell-0 -- bash"
alias ct_mongo_shell="kubectl exec --stdin=true --tty=true -n mongo mongo-shell-0 -- bash"
alias ct_vitess_shell="kubectl exec --stdin=true --tty=true -n vitess vitess-shell-0 -- bash"

# Vi mode
fish_vi_key_bindings

# Disable welcome message
set fish_greeting

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

# Set VIM as my default editor
set -x EDITOR vim

# Set lang to UTF-8
set -x LANGUAGE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LC_TYPE en_US.UTF-8

# Rust stuff
bass source $HOME/.cargo/env
fish_add_path $HOME/.local/bin

# Node stuff
set -x NVM_DIR "$HOME/.nvm"

# Alias ls to exa
# general use
alias ls='exa'															# ls
alias l='exa -lbF --git'                                                # list, size, type, git
alias ll='exa -lbGF --git'												# long list
alias llm='exa -lbGd --git --sort=modified'								# long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'	# all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'	# all + extended list

# special views
alias lS='exa -1'                                                       # one column, just names
alias lt='exa --tree --level=2'                                         # tree

# Alias codelldb
alias codelldb=$HOME/codelldb/extension/adapter/codelldb

# Alias vim
alias nvim=$HOME/apps/nvim/bin/nvim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# Alias python & pip
alias python=python3
alias pip=pip3

# Theme
source $HOME/.config/fish/kanagawa-theme.fish

# Completions
gh completion -s fish | source
zoxide init fish | source

# Starship prompt
source (/usr/local/bin/starship init fish --print-full-init | psub)
