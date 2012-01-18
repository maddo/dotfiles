### Config Variables ###

set code_path /home/mike/code/

### Transports ###

function TOcodePath
    cd {$code_path}/
end

### End Transports ###

### Begin Symfony ###

function symfony
    app/console $argv
end

function search-symfony
    app/console | grep $argv
end

function search-routes
    symfony router:debug | grep $argv
end

### End Symfony ###

### Config Shortcuts ###

function editgit
	vim ~/.gitconfig
end
function editfish
	vim ~/.config/fish/config.fish
end
function edithosts
	sudo vim /etc/hosts
end
function editvim
    vim ~/.vimrc
end

### End Config Shortcuts ###

### Misc Helpers ###

function g
    grep -r $argv[1] *
end
function pyserve
    python -m "SimpleHTTPServer" $argv[1]
end
function start-ubuntu
    VBoxHeadless -startvm Ubuntu &
end
function xkcd
    wget -q http://dynamic.xkcd.com/comic/random/ -O-| sed -n '/<img src="http:\/\/imgs.xkcd.com\/comics/{s/.*\(http:.*\)" t.*/\1/;p}' | awk '{system ("wget -q " $1 " -O- | display -title $(basename " $1") -write /tmp/$(basename " $1")");}'
end

### End Misc Helpers ###

### Mac Specific ###

function updatedb-mac
    sudo /usr/libexec/locate.updatedb
end
function reap-mac
    sudo apachectl restart
end

### End Mac Specific ###

### Database Connects ###

function DBLOCAL
        mysql -u root
end

### End Database Connects ###

### Fish Specific ###

function fish_prompt -d "Write out the prompt"
    set_color cyan
        set branch (git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
        printf '%s@%s%s %s%s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color yellow) (echo $branch) (set_color normal)
end

### End Fish Specific ###

### Vim ###

function vim -d 'Vi improved'
    set old_shell $SHELL
    set SHELL /bin/sh
    command vim $argv
    set SHELL $old_shell
end

#function vim -d 'Vi improved'
#    set old_shell $SHELL
#    set SHELL /bin/sh
#    if which mvim >/dev/null
#        command mvim $argv
#    else
#        command vim -T xterm-256color $argv
#    end
#    set SHELL $old_shell
#end

function vi -d 'Vi improved'
    vim $argv
end

### End Vim ###


### SSH ###

function clear-known-host
    set line "$argv[1]""d"
    set known_hosts '~/.ssh/known_hosts'
    sed -i $line $known_hosts
end
function enable-no-pass-connection
    cat ~/.ssh/id_rsa.pub | ssh $argv 'cat >> ~/.ssh/authorized_keys'
end

### End SSH ###
