alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias cls='clear'
alias x='echo "$1"'
alias dbm='zeus rake db:migrate'
alias dboops='zeus rake db:rollback'
alias dir='ls'
alias mk-db-migration='rails generate migration '
alias mysqld='sudo /usr/local/mysql/support-files/mysql.server'
alias rake='zeus rake'
alias rq-start-all='\rake resque:work QUEUE="*"'
alias rq-start="echo rake resque:work QUEUE='\"$1\"'"
alias zc='zeus console'
alias zs='zeus server'
alias zstart='zeus start'
myrails() {
	bundle exec rails $* -p 4000 -P tmp/pids/server2.pid
}
alias rails2=myrails
