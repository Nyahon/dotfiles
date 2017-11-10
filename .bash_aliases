#==================
#useful && portable
#==================
alias valias='vim ~/.bash_aliases'
alias vimrc='vim ~/.vimrc'
alias q='exit'
alias sudo='sudo '
alias open='xdg-open' 
alias space='du -hs * | sort -h'
alias mountC='mount | colum -t'
alias openports='netstat -tulanp'
alias rmsafe='rm -I --preserve-root'
alias update='sudo apt update && sudo apt upgrade'
alias raminfo='free -m -l -t -h'
#print current ip
alias ipis="ip r g to $(ip r l to 0/0 | awk '{print $3}') | awk '/src/ {print $5}'"
#go to most recent folder in ./
alias llcd='cd $(ls -dtr */ | tail -1)'
alias chmox='chmod +x $1'
#copy the most recent file in dl to current directory
alias cplast='cp ~/Downloads/`ls ~/Downloads -tr | tail -n 1` .'

#search 
alias fd="find -iname $1"
#search&edit
fvim() {
    oldifs="$IFS"
    IFS=$'\n'  #allow to split by lines and not by words

    #produce list of found files
    array=($(find -iname "$1" 2> /dev/null))
    for (( i=0; i<${#array[@]}; i++ )); do echo $i ${array[i]}; done
    IFS="$oldifs"
    
    #choose one file to be edited
    read input </dev/tty
    re='^[0-9]+$'
    if ! [[ $input =~ $re ]] ; then
        echo "error: not an integer" >&2; return 1
    fi

    if [[ $input -ge ${#array[@]} ]] ; then
        echo "error: not a valid choice" >&2; return 1
    fi
    vim "${array[$input]}"
}
#alias extensions="find . -type f | awk -F. '!a[\$NF]++{print \$NF}'"
alias extensions="find . -type f | sed -e 's/.*\.//' | sed -e 's/.*\///' | sort | uniq -c | sort -rn"
## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

#===================
#useful
#===================
alias heig="cd /home/nyahon/Documents/HEIG/HEIG-S3"
alias notes="cd /home/nyahon/git/Homepage/ && sudo ./getNotes.sh && sudo php -S 127.0.0.1:80"
alias logisim='java -jar ~/bin/logisim-evolution.t.jar'
alias clion='~/bin/*/bin/clion.sh'
alias minecraft="java -jar /home/nyahon/minecraft/Minecraft.jar"

#===================
#installations
#===================

#list installed packages, different output forms
lspkg() {
while getopts ":al" option; do
    echo "option is " $options

    case $option in
        a) declare -a arr=($(find /etc/apt -type f -name '*.list*')); 
            for i in "${arr[@]}" 
            do
                echo -e "\n$i\n"; nl -ba "$i"  ;
            done 
            op = "1";
            return 1 ;;
        l) ls -l /etc/apt/sources.list.d/; return 1;;
        ?) echo "invalid option: $OPTARG"; op="1"; return 1 ;;
    esac
done

if [ -z "$op" ]; then ls /etc/apt/sources.list.d/;return 1; fi
}


