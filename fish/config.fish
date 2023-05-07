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

# Alias zoxide
alias cd='z'

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

# fish completion for gh                                   -*- shell-script -*-

function __gh_debug
    set -l file "$BASH_COMP_DEBUG_FILE"
    if test -n "$file"
        echo "$argv" >> $file
    end
end

function __gh_perform_completion
    __gh_debug "Starting __gh_perform_completion"

    # Extract all args except the last one
    set -l args (commandline -opc)
    # Extract the last arg and escape it in case it is a space
    set -l lastArg (string escape -- (commandline -ct))

    __gh_debug "args: $args"
    __gh_debug "last arg: $lastArg"

    # Disable ActiveHelp which is not supported for fish shell
    set -l requestComp "GH_ACTIVE_HELP=0 $args[1] __complete $args[2..-1] $lastArg"

    __gh_debug "Calling $requestComp"
    set -l results (eval $requestComp 2> /dev/null)

    # Some programs may output extra empty lines after the directive.
    # Let's ignore them or else it will break completion.
    # Ref: https://github.com/spf13/cobra/issues/1279
    for line in $results[-1..1]
        if test (string trim -- $line) = ""
            # Found an empty line, remove it
            set results $results[1..-2]
        else
            # Found non-empty line, we have our proper output
            break
        end
    end

    set -l comps $results[1..-2]
    set -l directiveLine $results[-1]

    # For Fish, when completing a flag with an = (e.g., <program> -n=<TAB>)
    # completions must be prefixed with the flag
    set -l flagPrefix (string match -r -- '-.*=' "$lastArg")

    __gh_debug "Comps: $comps"
    __gh_debug "DirectiveLine: $directiveLine"
    __gh_debug "flagPrefix: $flagPrefix"

    for comp in $comps
        printf "%s%s\n" "$flagPrefix" "$comp"
    end

    printf "%s\n" "$directiveLine"
end

# This function does two things:
# - Obtain the completions and store them in the global __gh_comp_results
# - Return false if file completion should be performed
function __gh_prepare_completions
    __gh_debug ""
    __gh_debug "========= starting completion logic =========="

    # Start fresh
    set --erase __gh_comp_results

    set -l results (__gh_perform_completion)
    __gh_debug "Completion results: $results"

    if test -z "$results"
        __gh_debug "No completion, probably due to a failure"
        # Might as well do file completion, in case it helps
        return 1
    end

    set -l directive (string sub --start 2 $results[-1])
    set --global __gh_comp_results $results[1..-2]

    __gh_debug "Completions are: $__gh_comp_results"
    __gh_debug "Directive is: $directive"

    set -l shellCompDirectiveError 1
    set -l shellCompDirectiveNoSpace 2
    set -l shellCompDirectiveNoFileComp 4
    set -l shellCompDirectiveFilterFileExt 8
    set -l shellCompDirectiveFilterDirs 16

    if test -z "$directive"
        set directive 0
    end

    set -l compErr (math (math --scale 0 $directive / $shellCompDirectiveError) % 2)
    if test $compErr -eq 1
        __gh_debug "Received error directive: aborting."
        # Might as well do file completion, in case it helps
        return 1
    end

    set -l filefilter (math (math --scale 0 $directive / $shellCompDirectiveFilterFileExt) % 2)
    set -l dirfilter (math (math --scale 0 $directive / $shellCompDirectiveFilterDirs) % 2)
    if test $filefilter -eq 1; or test $dirfilter -eq 1
        __gh_debug "File extension filtering or directory filtering not supported"
        # Do full file completion instead
        return 1
    end

    set -l nospace (math (math --scale 0 $directive / $shellCompDirectiveNoSpace) % 2)
    set -l nofiles (math (math --scale 0 $directive / $shellCompDirectiveNoFileComp) % 2)

    __gh_debug "nospace: $nospace, nofiles: $nofiles"

    # If we want to prevent a space, or if file completion is NOT disabled,
    # we need to count the number of valid completions.
    # To do so, we will filter on prefix as the completions we have received
    # may not already be filtered so as to allow fish to match on different
    # criteria than the prefix.
    if test $nospace -ne 0; or test $nofiles -eq 0
        set -l prefix (commandline -t | string escape --style=regex)
        __gh_debug "prefix: $prefix"

        set -l completions (string match -r -- "^$prefix.*" $__gh_comp_results)
        set --global __gh_comp_results $completions
        __gh_debug "Filtered completions are: $__gh_comp_results"

        # Important not to quote the variable for count to work
        set -l numComps (count $__gh_comp_results)
        __gh_debug "numComps: $numComps"

        if test $numComps -eq 1; and test $nospace -ne 0
            # We must first split on \t to get rid of the descriptions to be
            # able to check what the actual completion will be.
            # We don't need descriptions anyway since there is only a single
            # real completion which the shell will expand immediately.
            set -l split (string split --max 1 \t $__gh_comp_results[1])

            # Fish won't add a space if the completion ends with any
            # of the following characters: @=/:.,
            set -l lastChar (string sub -s -1 -- $split)
            if not string match -r -q "[@=/:.,]" -- "$lastChar"
                # In other cases, to support the "nospace" directive we trick the shell
                # by outputting an extra, longer completion.
                __gh_debug "Adding second completion to perform nospace directive"
                set --global __gh_comp_results $split[1] $split[1].
                __gh_debug "Completions are now: $__gh_comp_results"
            end
        end

        if test $numComps -eq 0; and test $nofiles -eq 0
            # To be consistent with bash and zsh, we only trigger file
            # completion when there are no other completions
            __gh_debug "Requesting file completion"
            return 1
        end
    end

    return 0
end

# Since Fish completions are only loaded once the user triggers them, we trigger them ourselves
# so we can properly delete any completions provided by another script.
# Only do this if the program can be found, or else fish may print some errors; besides,
# the existing completions will only be loaded if the program can be found.
if type -q "gh"
    # The space after the program name is essential to trigger completion for the program
    # and not completion of the program name itself.
    # Also, we use '> /dev/null 2>&1' since '&>' is not supported in older versions of fish.
    complete --do-complete "gh " > /dev/null 2>&1
end

# Remove any pre-existing completions for the program since we will be handling all of them.
complete -c gh -e

# The call to __gh_prepare_completions will setup __gh_comp_results
# which provides the program's completion choices.
complete -c gh -n '__gh_prepare_completions' -f -a '$__gh_comp_results'

source $HOME/.config/fish/kanagawa-theme.fish

zoxide init fish | source

source (/usr/local/bin/starship init fish --print-full-init | psub)
