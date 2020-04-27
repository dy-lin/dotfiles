#------------------------------------------------------------------------------#
#                                     NOTES                                    #
#------------------------------------------------------------------------------#
# use VI for navigation on commandline bash
# set -o vi
# \fch <string> to create comment frame hash block
# \cc <to comment currently highlihgted line (will depend on language for symbol)

#------------------------------------------------------------------------------#
#                                    EXPORTS                                   #
#------------------------------------------------------------------------------#
# To resize before every prompt
# export PROMPT_COMMAND="resize &>/dev/null; $PROMPT_COMMAND"

# silence the bash shell deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_AUTO_UPDATE=1
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
# export LSCOLORS=ExFxBxDxCxegedabagacad
export CLICOLOR=1
export LSCOLORS=exGxcxdxcxeggdabagacad

#------------------------------------------------------------------------------#
#                                    EXPORTS                                   #
#------------------------------------------------------------------------------#
# alias sed='/usr/local/bin/gsed'
# alias awk='/usr/local/bin/gawk'
# alias grep='/usr/local/bin/ggrep'
# alias find=/usr/local/bin/gfind'

# alias to launch pc login
alias pc='~/pc.exp'
alias ls='ls -h'
alias ytdl='~/youtube.sh'
# alias sftp="with-readline sftp"
alias unhide='hide -u'
# alias sshh='ssh dlin@ssh.bcgsc.ca'
# alias sftpp='sftp dlin@xfer.bcgsc.ca'
alias ssh='gsc'
alias sftp='gsc2'
alias brew='/usr/local/Homebrew/bin/brew'

#------------------------------------------------------------------------------#
#                                    PROMPT                                    #
#------------------------------------------------------------------------------#
BLUE="\[\033[1;36m\]"
YELLOW="\[\033[33m\]"
PURPLE="\[\033[35m\]"
GREEN="\[\033[32m\]"
WHITE="\[\033[0m\]"

PS1="${WHITE}[ ${BLUE}\u${YELLOW}@${PURPLE}\h${YELLOW}: ${GREEN}\w ${WHITE}] ${WHITE}\$ "

#------------------------------------------------------------------------------#
#                                     PATHS                                    #
#------------------------------------------------------------------------------#
# BASE PATH
export PATH="$(getconf PATH)"
MINICONDA_PATH="$HOME/anaconda/bin"
HOMEBREW_PATH="/usr/local/bin"
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
MY_BIN="$HOME/bin"

GNU_BIN="/usr/local/opt/coreutils/libexec/gnubin"
GNU_MAN="/usr/local/opt/coreutils/libexec/gnuman"

GREP_BIN="/usr/local/opt/grep/libexec/gnubin"
GREP_MAN="/usr/local/opt/grep/libexec/gnuman"

SED_BIN="/usr/local/opt/gnu-sed/libexec/gnubin"
SED_MAN="/usr/local/opt/gnu-sed/libexec/gnuman"

AWK_BIN="/usr/local/opt/gawk/libexec/gnubin"
AWK_MAN="/usr/local/opt/gawk/libexec/gnuman"

FIND_BIN="/usr/local/opt/findutils/libexec/gnubin"
FIND_MAN="/usr/local/opt/findutils/libexec/gnuman"

export MANPATH=$GNU_MAN:$GREP_MAN:$SED_MAN:$AWK_MAN:$FIND_MAN:$MANPATH
export PATH=$MINICONDA_PATH:$GNU_BIN:$GREP_BIN:$SED_BIN:$AWK_BIN:$FIND_BIN:$HOMEBREW_PATH:$MY_BIN:$PATH

#------------------------------------------------------------------------------#
#                                   FUNCTIONS                                  #
#------------------------------------------------------------------------------#
function j() {
	url=$(pbpaste)
	open "https://ezproxy.library.ubc.ca/login?url=$url"
}

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

function gsc() {
	if [[ "$#" -eq 0 ]]
	then
		~/gsc.exp dlin02.phage.bcgsc.ca
	else
		~/gsc.exp $1
	fi
}

function gsc2() {
	if [[ "$#" -eq 0 ]]
	then
		~/transfer.exp
	fi
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
	LINES=$(tput lines)
	export COLUMNS LINES;
	echo "Resized."
}

# echo "To update GitHub repos, please use 'pull'."
function pull() {
	for i in $(gfind ~ -maxdepth 3 -name ".git" 2> /dev/null | sort)
	do
		if [[ "$i" == "/Users/dianalin/dotfiles/.git" || "$i" == "/Users/dianalin/scripts/.git" ]]
		then
			continue
		fi
		cd $(dirname $i)
		echo -n "$(basename $(dirname $i)): "
		git pull
		cd ~
	done
}

# echo "To sync your fork with the upstream repo, please use 'sync'."
function sync() {
	git fetch upstream
	git merge upstream/master
}

function upload() {
	if [[ "$#" -ne 2 ]]
	then
		echo "USAGE: upload <LOCAL PATH> <REMOTE PATH>" 1>&2
		return
	fi
	~/upload.exp $1 $2
}


function download() {
	if [[ "$#" -ne 2 ]]
	then
		echo "USAGE: download <REMOTE PATH> <LOCAL PATH>" 1>&2
		return
	fi
	~/download.exp $1 $2
}

#------------------------------------------------------------------------------#
#                                   BIOSYNTAX                                  #
#------------------------------------------------------------------------------#
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

#------------------------------------------------------------------------------#
#                               POWERLINE PROMPT                               #
#------------------------------------------------------------------------------#
# export PATH=$PATH:/Users/dianalin/.local/bin
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# # export PROMPT_COMMAND="hostname cwd"
# source /Users/dianalin/.local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

#------------------------------------------------------------------------------#
#                                    STARTUP                                   #
#------------------------------------------------------------------------------#
resize &> /dev/null
# check window size upon start up 
shopt -s checkwinsize
