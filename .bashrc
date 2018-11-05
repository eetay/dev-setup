alias vi=vim
export EVENT_NOKQUEUE=1
export SNYK_TOKEN=931ca9c3-b31b-4c84-9943-8b69f691c16d
alias git-subm-status='git status && git submodule foreach "git status"'
function git-subm-verify-on-master {
  git submodule foreach -q --recursive 'git branch --contains `git rev-parse HEAD` | grep "^ *master" || echo "Problem: $name is now NOT on master" '
}
alias git-show-tags='git log --tags --simplify-by-decoration --pretty="format:%ci %d"'
alias git-subm-pull='git pull --recurse-submodules && git submodule update && git-subm-verify-on-master'
alias git-subm-push='git push --recurse-submodules=on-demand'
alias add-root-cert='sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain'
alias webstorm='open -a /Applications/WebStorm.app'
function git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/^* \(.*\)/(\1)/'
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\](\$(git_branch))\[\033[m\]> "
export PS1="\[\033[31m\]\u:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\]\$(git_branch)\[\033[m\]> "
function rspec-smoke {
	rspec spec -b --tag smoke --format p --format d --out tmp/rspec-smoke-results
}
function force-get-table {
  force query "select `force field list $1 | sed 's/:.*$/,/' | sed '$s/,//'` from $1" | less -S
}
function docker-start {
  docker-machine start default
  docker-machine regenerate-certs default
  eval "$(docker-machine env default)"
}
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --js-flags='--stack-trace-limit 10000'"
alias rails-debug="RAILS_DEBUG=1 rails s "
alias ssh-fingerprint="ssh-keygen -lf "
alias ssh-getpub="ssh-keygen -m PKCS8 -y -f "
#alias -="less"
alias ll="ls -la"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias atom='/Applications/Atom.app/Contents/MacOS/Atom'
export BUNDLER_EDITOR='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias cls='echo "----------------------------------------------------" && clear'
alias bashrc="source ~/.profile; source ~/.bashrc"
alias db-migrate='rake db:migrate'
alias dboops='rake db:rollback'
alias dir='ls'
alias mk-db-migration='rails generate migration '
alias mysqld='sudo /usr/local/mysql/support-files/mysql.server'
#alias mysqld='echo Use "brew services restart mysql" '
alias rq-start-all='rake resque:work QUEUE="high,low_high_mem,medium,ts_delta,failed"'
_rqstart() {
	rake resque:work QUEUE="$@"
}
alias rq-start=_rqstart
alias zc='zeus console'
alias zs='zeus server'
alias zstart='zeus start'
strip-sf-sample() {
  cat $1 | awk '{ if (match($0,"^[0-9]+$")) ; else print $0 }'
}
rails2() {
	bundle exec rails $* -p 4000 -P tmp/pids/server2.pid
}
alias new-terminal-tab='osascript -e "tell application \"Terminal\" to activate" -e "tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down"'
function rails-diff {
	colordiff -d -w -B -u -r -x log -x .git -x tmp "$@" | less -R
}
alias upload="./samanage_ey.rb recipes upload -e audit_testing --apply"
alias rspec-next='rake db:test:prepare && rspec spec --exclude-pattern "**/requests/*_spec.rb" --fail-fast' 
alias aws='aws --region us-east-1 --profile samanage-sandbox'
#alias rspec-next='rspec spec --exclude-pattern "**/requests/*_spec.rb" --fail-fast' 
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash


if (echo "$-" | grep i); then
  echo "interactive"
  docker-machine start
  # sudo /usr/local/mysql/support-files/mysql.server start
fi
export AWS_SDK_LOAD_CONFIG=1

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/eetay/.nvm/versions/node/v7.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/eetay/.nvm/versions/node/v7.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/eetay/.nvm/versions/node/v7.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/eetay/.nvm/versions/node/v7.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
nvm alias default 9.11.1
