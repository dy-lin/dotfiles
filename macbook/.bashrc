#PS1="\[\033[1;36m\]\u\[\033[33m\]@\[\033[35m\]\h\[\033[33m\]:\[\033[34m\]\w ' '\[\033[32m\]$' '"
# PS1="\[\e[1;36m\]\u\[\e[33m\]@\[\e[35m\]\h\[\e[33m\]:\[\e[32m\]\w \[\e[0m\]\$\[\e[0m\] "
# reset
# PS1="\[$(tput bold)\][\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;11m\]@\[$(tput sgr0)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\]\[\033[38;5;11m\]:\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;10m\]\W\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]]\[$(tput sgr0)\] \[$(tput bold)\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
# export PROMPT_COMMAND="resize &>/dev/null; $PROMPT_COMMAND"
alias sed='/usr/local/bin/gsed'
alias awk='/usr/local/bin/gawk'
alias grep='/usr/local/bin/ggrep'

# use VI for navigation on commandline bash
# set -o vi
export BASH_SILENCE_DEPRECATION_WARNING=1
BLUE="\[\033[1;36m\]"
YELLOW="\[\033[33m\]"
PURPLE="\[\033[35m\]"
GREEN="\[\033[32m\]"
WHITE="\[\033[0m\]"

PS1="$WHITE[ $BLUE\u$YELLOW@$PURPLE\h$YELLOW: $GREEN\w $WHITE] $WHITE\$ "

shopt -s checkwinsize

export PATH="$(getconf PATH)"
export PATH="/Users/dianalin/anaconda/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/usr/local/Homebrew/bin:$PATH"
export PATH="~/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
#export LSCOLORS=ExFxBxDxCxegedabagacad
export CLICOLOR=1
export LSCOLORS=exGxcxdxcxeggdabagacad
alias ls='ls -h'
alias ytdl='~/youtube.sh'
alias dl='sftp dlin@xfer.bcgsc.ca'

function ez() {
	if [[ "$#" -ne 1 ]]
	then
		echo "USAGE: ez <URL>" 1>&2
		return
	fi
	open "https://ezproxy.library.ubc.ca/login?url=$1"
}


export HOMEBREW_NO_AUTO_UPDATE=1
# alias ls='ls -Fh'
#alias sftp="with-readline sftp"
function strip() {
	echo "$1" | sed 's/^ *//' | sed 's/ *$//'
}
function hide() {
	undo=false
	local OPTIND
	while getopts ":u" OPT
	do
		case $OPT in
			u) undo=true ;;
			\?) echo "hide: invalid option -$OPT"; exit 1;;
		esac
	done
	shift $((OPTIND-1))
	string=$1
	
	if [[ "$(echo $string | grep -c '@')" -eq 1 ]]
	then
		email=true
	else
		email=false
	fi

	if [[ "$undo" = false ]]
	then
		if [[ "$email" = true ]]
		then
			echo $string | sed 's/\./[dot]/g' | sed 's/@/[at]/'
		else
			echo $string | sed 's/\./[dot]/g' | sed -E 's/https?:\/\///'
		fi
	else
		if [[ "$email" = true ]]
		then
			echo $string | sed 's/\[dot\]/./g' | sed 's/\[at\]/@/'
		else
			echo $string | sed 's/\[dot\]/./g' | sed 's/^/https:\/\//'
		fi
	fi
}

alias unhide='hide -u'
alias sshh='ssh dlin@ssh.bcgsc.ca'
alias sftpp='sftp dlin@xfer.bcgsc.ca'

function gsc() {
	if [[ "$#" -eq 0 ]]
	then
		~/gsc.exp dlin02.phage.bcgsc.ca
#	elif [[ "$1" == orca* ]]
#	then
#		~/orca.exp	
	else
		~/gsc.exp $1
	fi
}


alias imac='~/imac.exp'

function txt() {
	cd ~/Downloads
	for file in $(ls cm*.txt)
	do
		filename=$(basename $file ".txt")
		mv $file ~/STAT545-participation/$filename
	done
	cd ~
}

function add() {
	numbers=$(cat)
	if [[ ! -z "$numbers" ]]
	then
		sum=0
		for num in $numbers
		do
			sum=$((sum+num))
		done
	else
		numbers=$@
		sum=0
		for num in ${numbers[@]}
		do
			sum=$((sum+num))
		done
	fi
	echo $sum
}

function igv() {
	~/IGV_2.7.0/igv.sh $*
}

function igvtools() {
	~/IGV_2.7.0/igvtools $*
}

function resize() {
	COLUMNS=$(tput cols)
#	echo "COLUMNS=$COLUMNS;"
	LINES=$(tput lines)
#	echo "LINES=$LINES;"
	export COLUMNS LINES;
#	echo "export COLUMNS LINES;"
	echo "Resized."
}

resize &> /dev/null
# alias git='git pull 2> /dev/null; git'

alias ssh='gsc'

#------------------------------------------------------------------------------#
#                               Powerline Prompt                               #
#------------------------------------------------------------------------------#
# export PATH=$PATH:/Users/dianalin/.local/bin
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# # export PROMPT_COMMAND="hostname cwd"
# source /Users/dianalin/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

alias find='gfind'
##   __     __   __           ___
##  |__) | /  \ /__` \ / |\ |  |   /\  \_/
##  |__) | \__/ .__/  |  | \|  |  /~~\ / \
##  =======================================
##
## Syntax Highlighting for computational biology bp.append
## v0.1
##
## Append this to your ~/.bashprofile in MacOS
## to enable source-highlight for less and add
## bioSyntax pipe capability on your command line
##
#export HIGHLIGHT="/usr/local/opt/source-highlight/share/source-highlight"
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

alias less='less -NSi -# 10'
# -N: add line numbers
# -S: don't wrap lines (force to single line)
# -# 10: Horizontal scroll distance

alias more='less'

# Explicit call of  <file format>-less for piping data
# i.e:  samtools view -h aligned_hits.bam | sam-less
# Core syntaxes (default)
alias clustal-less='source-highlight -f esc --lang-def=clustal.lang --outlang-def=bioSyntax.outlang     --style-file=fasta.style | less'
alias bed-less='source-highlight     -f esc --lang-def=bed.lang     --outlang-def=bioSyntax.outlang     --style-file=sam.style   | less'
alias fa-less='source-highlight      -f esc --lang-def=fasta.lang   --outlang-def=bioSyntax.outlang     --style-file=fasta.style | less'
alias fq-less='source-highlight      -f esc --lang-def=fastq.lang   --outlang-def=bioSyntax.outlang     --style-file=fasta.style | less'
alias gtf-less='source-highlight     -f esc --lang-def=gtf.lang     --outlang-def=bioSyntax-vcf.outlang --style-file=vcf.style   | less'
alias pdb-less='source-highlight     -f esc --lang-def=pdb.lang     --outlang-def=bioSyntax-vcf.outlang --style-file=pdb.style   | less'
alias sam-less='source-highlight     -f esc --lang-def=sam.lang     --outlang-def=bioSyntax.outlang     --style-file=sam.style   | less'
alias vcf-less='source-highlight     -f esc --lang-def=vcf.lang     --outlang-def=bioSyntax-vcf.outlang --style-file=vcf.style   | less'
alias bam-less='sam-less'

# Auxillary syntaxes (uncomment to activate)
alias fai-less='source-highlight      -f esc --lang-def=faidx.lang    --outlang-def=bioSyntax.outlang   --style-file=sam.style   | less'
alias flagstat-less='source-highlight -f esc --lang-def=flagstat.lang --outlang-def=bioSyntax.outlang   --style-file=sam.style   | less'
