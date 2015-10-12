function git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/^* \(.*\)/(\1)/'
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\](\$(git_branch))\[\033[m\]> "
export PS1="\[\033[31m\]\u:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\]\$(git_branch)\[\033[m\]> "
function rspec-smoke {
	rspec spec -b --tag smoke --format p --format d --out tmp/rspec-smoke-results
}
alias ssh-fingerprint="ssh-keygen -lf "
alias ssh-getpub="ssh-keygen -m PKCS8 -y -f "
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias cls='clear'
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
rails2() {
	bundle exec rails $* -p 4000 -P tmp/pids/server2.pid
}
alias new-terminal-tab='osascript -e "tell application \"Terminal\" to activate" -e "tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down"'
function rails-diff {
	colordiff -d -w -B -u -r -x Gemfile.lock -x log -x .git -x tmp "$@"
}
alias upload="./samanage_ey.rb recipes upload -e audit_testing --apply"
