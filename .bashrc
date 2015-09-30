alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias cls='clear'
alias bashrc="source ~/.bashrc"
alias db-migrate='rake db:migrate'
alias dboops='rake db:rollback'
alias dir='ls'
alias mk-db-migration='rails generate migration '
alias mysqld='sudo /usr/local/mysql/support-files/mysql.server'
alias rq-start-all='rake resque:work QUEUE="*"'
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
