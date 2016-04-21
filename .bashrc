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
alias rails-debug="RAILS_DEBUG=1 rails s "
alias ssh-fingerprint="ssh-keygen -lf "
alias ssh-getpub="ssh-keygen -m PKCS8 -y -f "
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
export BUNDLER_EDITOR='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias cls='echo "----------------------------------------------------" && clear'
alias bashrc="source ~/.profile; source ~/.bashrc"
alias db-migrate='rake db:migrate'
alias dboops='rake db:rollback'
alias dir='ls'
alias mk-db-migration='rails generate migration '
alias mysqld='sudo /usr/local/mysql/support-files/mysql.server'
alias rq-start-all='rake resque:work QUEUE="high low_high_mem medium ts_delta failed"'
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
#alias rspec-next='rspec spec --exclude-pattern "**/requests/*_spec.rb" --fail-fast' 
