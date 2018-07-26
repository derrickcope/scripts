# ~/.bash_profile

#Add .bin ruby and perl6 to $PATH
export PATH="${PATH}:$HOME/.bin:$HOME/.rakudobrew/bin:$HOME/.gem/ruby:$HOME/.gem/ruby/2.5.0/bin${PATH+:}";
#PATH="/home/derrick/perl5/bin${PATH+:}${PATH}"; export PATH;

#export to PATH
export PATH="$HOME/.cargo/bin:${PATH}"

[[ -f ~/.bashrc ]] && . ~/.bashrc

##startx automatically
##[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx;    

##Ask to startx
if [[ -z $DISPLAY && $XDG_VTNR -le 12 ]];
then
    echo "would you like to start X? (y/n)"
    while true; do
    read REPLY
    case $REPLY in
        [Yy]) exec startx ;;
        [Nn]) break ;;
        *) printf '%s/n' 'Please answer y or n.' ;;
    esac
done
fi


