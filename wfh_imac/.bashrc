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
#                                    ALIAS                                     #
#------------------------------------------------------------------------------#
# alias sed='/usr/local/bin/gsed'
# alias awk='/usr/local/bin/gawk'
# alias grep='/usr/local/bin/ggrep'
# alias find=/usr/local/bin/gfind'
# alias to launch pc login
alias rstudio='~/rstudio.exp'
alias pc='~/pc.exp'
alias ls='ls -h --color=auto'
alias ytdl='~/youtube.sh'
# alias sftp="with-readline sftp"
alias unhide='hide -u'
# alias sshh='ssh dlin@ssh.bcgsc.ca'
# alias sftpp='sftp dlin@xfer.bcgsc.ca'
alias ssh='gsc'
alias sftp='gsc2'
alias brew='/usr/local/Homebrew/bin/brew'
alias reset_usb='sudo killall -STOP -c usbd'
alias title="sed 's/.*/\L&/; s/[a-z]*/\u&/g'"
alias sentence="sed 's/.*/\L&/; s/[a-z]*/\u&/'"


# ZOOM ALIASES
alias zoom='~/zoom.sh'
alias amp='~/zoom.sh amp && exit'
alias biotalk='~/zoom.sh biotalk && exit'
alias stat545='~/zoom.sh stat545 && exit'
alias class='~/zoom.sh stat545 && exit'
alias ta='~/zoom.sh ta && exit'
alias sambina='~/zoom.sh sambina && exit'
alias btl='~/zoom.sh btl && exit'
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
UTIL_LINUX_PATH="/usr/local/opt/util-linux/bin"
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
MY_BIN="$HOME/bin"

# COREUTILS
CORE_BIN="/usr/local/opt/coreutils/libexec/gnubin"
CORE_MAN="/usr/local/opt/coreutils/libexec/gnuman"

# GREP
GREP_BIN="/usr/local/opt/grep/libexec/gnubin"
GREP_MAN="/usr/local/opt/grep/libexec/gnuman"

# GNU-SED
SED_BIN="/usr/local/opt/gnu-sed/libexec/gnubin"
SED_MAN="/usr/local/opt/gnu-sed/libexec/gnuman"

# GAWK
AWK_BIN="/usr/local/opt/gawk/libexec/gnubin"
AWK_MAN="/usr/local/opt/gawk/libexec/gnuman"

# FINDUTILS
FIND_BIN="/usr/local/opt/findutils/libexec/gnubin"
FIND_MAN="/usr/local/opt/findutils/libexec/gnuman"

# GNU-GETOPT
GETOPT_BIN="/usr/local/opt/gnu-getopt/libexec/gnubin"
GETOPT_MAN="/usr/local/opt/gnu-getopt/libexec/gnuman"

# GNU-TAR
TAR_BIN="/usr/local/opt/gnu-tar/libexec/gnubin"
TAR_MAN="/usr/local/opt/gnu-tar/libexec/gnuman"

# GNUTLS
TOOLS_BIN="/usr/local/opt/gnutls/libexec/gnubin"
TOOLS_MAN="/usr/local/opt/gnutls/libexec/gnuman"

# GNU-INDENT
INDENT_BIN="/usr/local/opt/gnu-indent/libexec/gnubin"
INDENT_MAN="/usr/local/opt/gnu-indent/libexec/gnuman"

TEXLIVE_BIN="/Library/TeX/texbin"

# OPENJDK
JDK_BIN="/usr/local/opt/openjdk/bin"

MAKE_BIN="/usr/local/opt/make/libexec/gnubin"

# MINICONDA
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export MANPATH=$CORE_MAN:$GREP_MAN:$SED_MAN:$AWK_MAN:$FIND_MAN:$INDENT_MAN:$TOOLS_MAN:$GETOPT_MAN:$TAR_MAN:$MANPATH
export PATH=$MAKE_BIN:$JDK_BIN:$TEXLIVE_BIN:$MINICONDA_PATH:$UTIL_LINUX_PATH:$CORE_BIN:$GREP_BIN:$SED_BIN:$AWK_BIN:$FIND_BIN:$INDENT_BIN:$TOOLS_BIN:$GETOPT_BIN:$TAR_BIN:$HOMEBREW_PATH:$MY_BIN:$PATH

#------------------------------------------------------------------------------#
#                                   FUNCTIONS                                  #
#------------------------------------------------------------------------------#
# function rstudio() {
# 	~/rstudio.exp
# 	open http://localhost:8787
# }

function knit() {
	if [[ -f $1 ]]
	then
		if [[ "$1" == *.Rmd ]]
		then
			Rscript -e "rmarkdown::render('$1', 'github_document')"
		else
			echo "File $1 is not an Rmarkdown file." 1>&2
		fi
	else
		echo "File $1 does not exist."  1>&2
	fi
}

function git_restore() {
	git restore $(git status | awk '/modified:/ {print $2}') 2> /dev/null
	git restore $(git status | awk '/deleted:/ {print $2}') 2> /dev/null
	git status
}

function git_add() {
	git add $(git status | awk '/modified:/ {print $2}')
	git status
}

function gen_ass() {
	ass=$1
	if [[ "$ass" != worksheet_0[0-9][ab] ]]
	then
		echo "Invalid worksheet name."
		return
	fi

	if ! ls ~/stat-545-instructor/worksheets/source/${ass}/${ass}.ipynb &> /dev/null
	then
		echo "File not found."
		return
	fi
	
	cd ~/stat-545-instructor/worksheets
	nbgrader generate_assignment --force $ass
}

function jn() {

	if [[ "$#" -eq 2 ]]
	then
		kind=$1
		if [[ "$kind" != "source" && "$kind" != "release" ]]
		then
			echo "ERROR: First argument must be 'source' or 'release'." 1>&2
			return
		fi
		ass=$2
		if [[ "$ass" != worksheet_0[0-9][ab] ]]
		then
			echo "ERROR: Invalid worksheet name."
			return
		fi
	elif [[ "$#" -eq 1 ]]
	then
		kind="source"
		ass=$1
		if [[ "$ass" != worksheet_0[0-9][ab] ]]
		then
			echo "ERROR: Invalid worksheet name."
			return
		fi
	elif [[ "$#" -eq 0 ]]
	then
		echo "USAGE: jn [source OR release] <worksheet_XXa>" 1>&2
	else
		echo "ERROR: Invalid arguments." 1>&2
		return
	fi

	cd ~/stat-545-instructor
#	git checkout master
	git pull
	cd - &> /dev/null

	if [[ "$kind" == "source" ]]
	then
		echo "Opening instructor version of ${ass}..." 1>&2
	else
		echo "Opening student version of ${ass}..." 1>&2
	fi
	jupyter notebook ~/stat-545-instructor/worksheets/${kind}/${ass}/${ass}.ipynb
}

function release() {

	if [[ "$#" -eq 1 ]]
	then
		ass=$1
		if [[ "$ass" != worksheet_0[0-9][ab] ]]
		then
			echo "ERROR: Invalid worksheet name." 1>&2
			return
		fi
	elif [[ "$#" -eq 2 ]]
	then
		ass=$1
		if [[ "$ass" != worksheet_0[0-9][ab] ]]
		then
			echo "ERROR: Invalid worksheet name." 1>&2
			return
		fi
		version=$2
		if [[ "$version" == [0-9].[0-9] ]]
		then
			:
		elif [[ "$version" == [0-9] ]]
		then
			version="${version}.0"
		fi
	else
		echo "ERROR: Incorrect number of arguments." 1>&2
		return
	fi

	cd ~/stat-545-instructor
	git checkout master
	git pull
	cd - &> /dev/null

	cd ~/stat545.stat.ubc.ca/content/worksheets/
	git checkout master
	git pull

	cp ~/stat-545-instructor/worksheets/release/${ass}/${ass}.ipynb .
	git add ${ass}.ipynb
	git commit -m "Release version ${version} of ${ass} to students"
	git push
	
	cd - &> /dev/null
}

function rmd() {
	if [[ "$#" -eq 2 ]]
	then
		case $1 in
			solutions) loc=$1;;
			milestone*) loc=$1;;
			?) echo "ERROR: First argument must be 'milestoneX' or 'solutions'." 1>&2; return;;
		esac
		if [[ "$2" != *.Rmd ]]
		then
			item=${2}.Rmd
		else
			item=$2a
		fi
		if [[ ! -f ~/stat-545-instructor/collaborative-project/$loc/$item ]]
		then
			echo "ERROR: The file does not exist." 1>&2
			echo "Did you mean:" 1>&2
			count=1
			for i in ~/stat-545-instructor/collaborative-project/$loc/*.Rmd
			do
				printf "\t%2d. " $count 
				basename $i
				count=$((count+1))
			done
			read -p "Number: " message

			item=$(basename $(ls ~/stat-545-instructor/collaborative-project/$loc/*.Rmd | awk -v var=$message 'NR==var'))
		fi
	elif [[ "$#" -eq 1 ]]
	then
		loc="solutions"
		if [[ "$1" != *.Rmd ]]
		then
			item=${1}.Rmd
		else
			item=$1
		fi
		if [[ ! -f ~/stat-545-instructor/collaborative-project/$loc/$item ]]
		then
			echo "ERROR: The file does not exist." 1>&2
			echo "Did you mean:" 1>&2
			count=1
			for i in ~/stat-545-instructor/collaborative-project/$loc/*.Rmd
			do
				printf "\t%2d. " $count 
				basename $i
				count=$((count+1))
			done
			read -p "Number: " message

			item=$(basename $(ls ~/stat-545-instructor/collaborative-project/$loc/*.Rmd | awk -v var=$message 'NR==var'))
		fi
	elif [[ "$#" -eq 0 ]]
	then
		echo "USAGE: rmd [milestoneX OR solutions] <*.Rmd>" 1>&2
		return 
	else
		echo "ERROR: Invalid arguments." 1>&2
		return
	fi

	cd ~/stat-545-instructor
	git checkout master
	git pull
	cd - &> /dev/null

	if [[ "$loc" == "solutions" ]]
	then
		echo "Opening the instructor version of $item..." 1>&2
	else
		echo "Opening the student version of $item..." 1>&2
	fi
		open ~/stat-545-instructor/collaborative-project/$loc/$item
}

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

# function igv() {
# 	~/IGV_2.7.0/igv.sh $*
# }
# 
# function igvtools() {
# 	~/IGV_2.7.0/igvtools $*
# }

function resize() {
	COLUMNS=$(tput cols)
	LINES=$(tput lines)
	export COLUMNS LINES;
	echo "Resized."
	
	# MAC built-in default is 80 cols x 24 rows
	# Changing MY default to 63 cols x 18 rows
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
	if [[ "$#" -ne 1  && "$#" -ne 2 ]]
	then
		echo "USAGE: download <REMOTE PATH> [LOCAL PATH]" 1>&2
		return
	fi

	if [[ "$#" -eq 1 ]]
	then
		~/download.exp $1 /Users/dlin/Downloads
	elif [[ "$#" -eq 2 ]]
	then
		~/download.exp $1 $2
	fi
}

function sra() {
	if [[ "$#" -ne 1 ]]
	then
		echo "USAGE: sra <REMOTE PATH>" 1>&2
		return
	fi
	~/upload.exp /Users/dianalin/Downloads/SraRunTable.txt $1
	rm /Users/dianalin/Downloads/SraRunTable.txt
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
# export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
# export LESS=" -R "
# 
# alias less='less -NSi -# 10'
# # -N: add line numbers
# # -S: don't wrap lines (force to single line)
# # -# 10: Horizontal scroll distance
# 
# alias more='less'
# 
# # Explicit call of  <file format>-less for piping data
# # i.e:  samtools view -h aligned_hits.bam | sam-less
# # Core syntaxes (default)
# alias clustal-less='source-highlight -f esc --lang-def=clustal.lang --outlang-def=bioSyntax.outlang     --style-file=fasta.style | less'
# alias bed-less='source-highlight     -f esc --lang-def=bed.lang     --outlang-def=bioSyntax.outlang     --style-file=sam.style   | less'
# alias fa-less='source-highlight      -f esc --lang-def=fasta.lang   --outlang-def=bioSyntax.outlang     --style-file=fasta.style | less'
# alias fq-less='source-highlight      -f esc --lang-def=fastq.lang   --outlang-def=bioSyntax.outlang     --style-file=fasta.style | less'
# alias gtf-less='source-highlight     -f esc --lang-def=gtf.lang     --outlang-def=bioSyntax-vcf.outlang --style-file=vcf.style   | less'
# alias pdb-less='source-highlight     -f esc --lang-def=pdb.lang     --outlang-def=bioSyntax-vcf.outlang --style-file=pdb.style   | less'
# alias sam-less='source-highlight     -f esc --lang-def=sam.lang     --outlang-def=bioSyntax.outlang     --style-file=sam.style   | less'
# alias vcf-less='source-highlight     -f esc --lang-def=vcf.lang     --outlang-def=bioSyntax-vcf.outlang --style-file=vcf.style   | less'
# alias bam-less='sam-less'
# 
# # Auxillary syntaxes (uncomment to activate)
# alias fai-less='source-highlight      -f esc --lang-def=faidx.lang    --outlang-def=bioSyntax.outlang   --style-file=sam.style   | less'
# alias flagstat-less='source-highlight -f esc --lang-def=flagstat.lang --outlang-def=bioSyntax.outlang   --style-file=sam.style   | less'
# 
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
complete -d cd
shopt -s direxpand
