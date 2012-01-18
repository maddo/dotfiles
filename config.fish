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
function g
    grep -r $argv[1] *
end
function updatedb-mac
    sudo /usr/libexec/locate.updatedb
end
function pyserve
    python -m "SimpleHTTPServer" $argv[1]
end

# ----------- Navigation ----------

#---------------------------------------DATABASES----------------------
function DBLOCAL
        mysql -u root
end

function fish_prompt -d "Write out the prompt"
    set_color cyan
        set branch (git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
        printf '%s@%s%s %s%s%s%s> ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color yellow) (echo $branch) (set_color normal)
end

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
function enable-no-pass-connection
    cat ~/.ssh/id_rsa.pub | ssh $argv 'cat >> ~/.ssh/authorized_keys'
end
function start-ubuntu
    VBoxHeadless -startvm Ubuntu &
end

#---------------------- SSH ---------------------------
function clear-known-host
    set line "$argv[1]""d"
    set known_hosts '~/.ssh/known_hosts'
    sed -i $line $known_hosts
end

function xkcd
    wget -q http://dynamic.xkcd.com/comic/random/ -O-| sed -n '/<img src="http:\/\/imgs.xkcd.com\/comics/{s/.*\(http:.*\)" t.*/\1/;p}' | awk '{system ("wget -q " $1 " -O- | display -title $(basename " $1") -write /tmp/$(basename " $1")");}'
end

function symfony
    app/console $argv
end

function reap-mac
    sudo apachectl restart
end
