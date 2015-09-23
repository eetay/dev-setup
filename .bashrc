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
function new_window {
    TMP_FILE="tmp.command"
    echo "#!/usr/bin/env bash" > $TMP_FILE

    # Copy over environment (including functions), but filter out readonly stuff
    set | grep -v "\(BASH_VERSINFO\|EUID\|PPID\|SHELLOPTS\|UID\)" >> $TMP_FILE

    # Copy over exported envrionment
    export -p >> $TMP_FILE

    # Change to directory
    echo "cd $(pwd)" >> $TMP_FILE

    # Copy over target command line
    echo "$@" >> $TMP_FILE

    chmod +x "$TMP_FILE"
    open -b com.apple.terminal "$TMP_FILE"

    sleep 1 # Wait for terminal to start
    rm "$TMP_FILE"
}
myrails() {
	bundle exec rails $* -p 4000 -P tmp/pids/server2.pid
}
alias rails2=myrails
