# .bashrc
export PKG_CONFIG_PATH=/gsc/btl/linuxbrew/Cellar/bash-completion@2/2.7/share/pkgconfig

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#------------------------------------------------------------------------------#
#                                     NOTES                                    #
#------------------------------------------------------------------------------#
# echo "subject" | mail -s "Numbers Job" dlin@bcgsc.ca

# XMATCHVIEW FONTS
# /projects/btl/lcoombe/git/xmatchview/tarballs/fonts

# TOP COMMAND TOGGLES
# l,m,t: to show/hide information at the top
	# l hides load average info
	# m hides memory information
	# t hids task and cpu information
	# these toggles also help toggle from bar graph
# P,N,T,R: sorting
	# P: sort by CPU usage
	# N: sort by process ID
	# T: sort by running time
	# R: reverse the sorting order
# x: highlight the sorted column with bold text
# b: highlight the sorted column with background colour
# d: change the update delay (i.e. top updates every 3.0 seconds)
# o,O: filter or search processes
	# e.g. COMMAND=apache (shows only commands containing the word apache)
# c: display full command path and arguments of process
# u,U: view processes of a user
# i: toggle display sleeping/idle processes
# V: forest mode - displays the processes in a parent child hierarchy
# n: change the number of processes to display
# 1: display all CPU cores
# f: show/hide columns

# https://www.binarytides.com/linux-top-command/
# https://www.redhat.com/sysadmin/customize-top-command

#------------------------------------------------------------------------------#
#                               GLOBAL VARIABLES                               #
#------------------------------------------------------------------------------#
# export TISSUES="bark embryo flush_bud mature_needle megagametophyte seed_germination xylem young_buds"
# export STONECELL="Cort_Par Dev_SC"
# export WPW="control gallery wound"
# export PG29_GENES="ABT39_00024884 ABT39_00024885 ABT39_00024887 ABT39_00102286 ABT39_00108568 ABT39_00122613"
# export Q903_GENES="E0M31_00027086 E0M31_00027087 E0M31_00055415 E0M31_00093276 E0M31_00093277"
# export WS77111_GENES="DB47_00018419 DB47_00018420 DB47_00018421 DB47_00018422 DB47_00018423 DB47_00018424 DB47_00028544 DB47_00044066 DB47_00073581 DB47_00073614 DB47_00080438"
# export ANURANS="calboguttata omargaretae pnigromaculatus rpipiens rtemporaria xallofraseri xborealis xlaevis xlargeni xtropicalis"
# export HYMENOPTERA="acerana aechinatior ccastaneus nvitripennis nvitripennis_venom omonticola pbarbatus trugatulus"
export timestamp_format="date '+%Y%m%d_%H%M%S'"
#------------------------------------------------------------------------------#
#                                    PROMPT                                    #
#------------------------------------------------------------------------------#
# PS1="[ \[\e[1;36m\]\u\[\e[33m\]@\[\e[35m\]\h\[\e[33m\]:\[\e[32m\] \W \[\e[0m\]] \$\[\e[0m\] "
BLUE="\[\033[1;36m\]"
YELLOW="\[\033[33m\]"
PURPLE="\[\033[35m\]"
GREEN="\[\033[32m\]"
WHITE="\[\033[0m\]"
PS1="$WHITE[ $BLUE\u$YELLOW@$PURPLE\h$YELLOW: $GREEN\w $WHITE] $WHITE\$ "

#------------------------------------------------------------------------------#
#                                      VI                                      #
#------------------------------------------------------------------------------#
# set VI navigation for bash commandline
# set -o vi

#------------------------------------------------------------------------------#
#                                  WINDOW SIZE                                 #
#------------------------------------------------------------------------------#
shopt -s checkwinsize

#------------------------------------------------------------------------------#
#                                   EXPANSION                                  #
#------------------------------------------------------------------------------#
if [[ "$HOSTNAME" != xfer* && "$(lsb_release -a | grep "Release:" | awk '{print $2}')" == 7* ]]
then
	# That is, $ROOT_DIR is expanded to /projects/amp/peptaid using TAB
	shopt -s direxpand
fi

if [[ "$HOSTNAME" == n* ]]
then
	complete -d cd
fi

#------------------------------------------------------------------------------#
#                                    ALIASES                                   #
#------------------------------------------------------------------------------#
# Numbers cluster aliases
if [[ "$HOSTNAME" == n* ]]
then
#	alias jobs='squeue -u dlin --format="%18i %9P %60j %8u %2t %10M %6D %R"'
	alias jobs='squeue -u dlin --format="%9i %9P %$(( $(tput cols) / 3 ))j %8u %2t %10M %6D %R"'
fi

alias ls='ls -h --color=auto'
alias vim='/gsc/btl/linuxbrew/bin/vim'
alias dtl='top -n 1 -b -u dlin | less'
alias wmi='readlink -f $(pwd)'
alias vimr='vim -M'
alias tsv="column -t -s$'\t'"
alias rmdiff='grep -Fvxf'
alias time_it='/usr/bin/time -pv'
alias dt='top -u dlin'
alias resize='/usr/bin/resize > /dev/null && echo "Resized."'
alias sambina='cd /projects/btl_scratch/saninta/amp_pipeline'
# export PROMPT_COMMAND="resize &>/dev/null ; $PROMPT_COMMAND"
alias timestamp="date '+%Y%m%d_%H%M%S'"
alias pst='ps -o pid,cmd -p $(pgrep -d, -u $USER -P 1) ww'  # get parent/root processes (not branches)
	
#------------------------------------------------------------------------------#
#                                     PATHS                                    #
#------------------------------------------------------------------------------#
# default path, but should be included in PATH above
# export PATH=$(getconf PATH)
export PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
#------------------------------------------------------------------------------#
#                             CONDA SETUP FOR LINUX                            #
#------------------------------------------------------------------------------#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/projects/btl/dlin/src/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/projects/btl/dlin/src/miniconda3/etc/profile.d/conda.sh" ]; then
		. "/projects/btl/dlin/src/miniconda3/etc/profile.d/conda.sh"
	else
		export PATH="/projects/btl/dlin/src/miniconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [[ "$HOSTNAME" == xfer* ]]
then
	LINUXBREW_PATH="/gsc/btl/linuxbrew/bin"
	MINICONDA_PATH="/projects/btl/dlin/src/miniconda3/bin"
	export PATH="$PATH:$LINUXBREW_PATH:$MINICONDA_PATH"
# LINUX PATHS
else
	LINUXBREW_PATH="/gsc/btl/linuxbrew/bin"
	MY_SCRIPTS_PATH="/projects/btl/dlin/scripts"
	MINICONDA_PATH="/projects/btl/dlin/src/miniconda3/bin"
	GMAP_PATH="/projects/btl/lcoombe/bin/gmap-2017-11-15_hpce/gmap-2017-11-15/bin"
	MY_BIN_PATH="/projects/btl/dlin/bin"
	LINUXBREW_R="/gsc/btl/linuxbrew/Cellar/r/3.5.1/bin"
	BBT_PATH="/projects/btl/lcoombe/bin/bbt/v2.2.0/bin"
	IGV_PATH="/projects/btl/dlin/bin/IGV_2.4.14"
	ABYSS_PATH="/gsc/btl/linuxbrew/Cellar/abyss/2.1.1-k128/bin"
	PUBSEQ_PATH="/home/pubseq/BioSw/phrap/current"
	DRSC_PATH="/gsc/software/linux-x86_64-centos6/drsc-2.0.2"
	SPEC_PATH="/gsc/software/linux-x86_64-centos6/spec-1.3.2"
	GSC_SCRIPTS="/gsc/software/scripts"
#	if [[ "$HOSTNAME" == xfer* || "$HOSTNAME" == gphost* ]]
#	if [[ "$(lsb_release -a | grep "Release:" | awk '{print $2}')" == 7*  || "$HOSTNAME" == xfer* ]]
#	then
#		export PATH="$MY_BIN_PATH:$PATH:$LINUXBREW_PATH:$MINICONDA_PATH:$MY_SCRIPTS_PATH"
#	else
#		export PATH="$MY_BIN_PATH:$LINUXBREW_PATH:$PATH:$MINICONDA_PATH:$MY_SCRIPTS_PATH"
#	fi

# Due to issues with linuxbrew whoami, ssh, and top, link those to $MY_BIN_PATH from /usr/bin, leaving linuxbrew first
#	export PATH="$MY_BIN_PATH:$LINUXBREW_PATH:$PATH:$MINICONDA_PATH:$MY_SCRIPTS_PATH"
# 	alias pip='/projects/btl/dlin/src/miniconda3/bin/pip'
# 	alias python='/projects/btl/dlin/src/miniconda3/bin/python'
# 	alias python3='/projects/btl/dlin/src/miniconda3/bin/python3'
# 	alias ssh='/usr/bin/ssh'
# 	alias top='/usr/bin/top'
# 	alias whoami='/usr/bin/whoami'
# 	alias perl='/gsc/btl/linuxbrew/bin/perl'
	export PATH="$MY_BIN_PATH:$LINUXBREW_PATH:$PATH:$MINICONDA_PATH:$MY_SCRIPTS_PATH"
#	export PATH="$PATH:$LINUXBREW_PATH:$MINICONDA_PATH"
fi

#------------------------------------------------------------------------------#
#                                   FUNCTIONS                                  #
#------------------------------------------------------------------------------#
function git_add() {
        git add $(git status | awk '/modified:/ {print $2}')
        git status
}

function git_restore() {
        git restore $(git status | awk '/modified:/ {print $2}')
        git status
}

function job() {
	if [[ "$HOSTNAME" == n* ]]
	then
		if [[ "$#" -eq 0 ]]
		then
			echo "ERROR: No job ID provided." 1>&2
			return
		fi

		for i in "$@"
		do
			job_name=$(scontrol show job $i | grep 'JobName=' | awk -F "=" '{print $NF}')
			if [[ "${PIPESTATUS[0]}" -eq 0 ]]
			then
				output=$(scontrol show job $i | grep 'StdErr=' | awk -F "=" '{print $NF}' | sed "s/%x/$job_name/")
				less $output
			else
				echo "ERROR: The job ID provided does not exist." 1>&2
			fi
		done
	else
		echo "You are not on numbers." 1>&2
		return
	fi
}

function aa() {
	word=$(echo "$*" | tr -d ' ')
	echo ${word^^}
}

# UPDATE the bin directory
function update() {
	for dir in $(ls -d /projects/btl/dlin/scripts/*)
	do
		ln -sf $(grep -v "README" <(ls $dir/*) | tr "\n" " ") /projects/btl/dlin/bin/
	done
}

# GET THE SHORTEST FILE EXTENSION
function getExt() {
var=$1
echo ${var##*.}
}

# GET THE LONGEST FILE EXTENSION
function getLongExt() {
var=$1
echo ${var#*.}
}

# GET THE LONGEST FILENAME (I.E. THE FILENAME THAT GOES WITH THE SHORTEST EXTENSION)
function getName() {
var=$1
echo ${var%.*}
}

# GET THE SHORTEST FILENAME
function getShortName() {
var=$1
echo ${var%%.*}
}

# MOVE ITEM TO TRASH (SAFER THAN RM)
function trash() {
	mv $* ~/.Trash
}

# GET CORRESPONDING GENOTYPE DIR (PARALLEL DIR ACROSS ALL SPECIES)
function genotype() {

	if [[ "$#" -eq 1 ]]
	then
		dir=$(pwd)
	elif [[ "$#" -eq 2 ]]
	then
		dir=$2
	else
		echo "USAGE: genotype <GENOTYPE> [DIRECTORY]" 1>&2
		return
	fi
	if [[ "$(echo "$dir" | grep -c 'spruceup_scratch')" -eq 0 ]]
	then
		current=$(echo "$dir" | awk -F "/" '{print $5}')
	else
		current=$(echo "$dir" | awk -F "/" '{print $4}')
	fi
		case $current in
			interior_spruce)
				gt="PG29"
				;;
			psitchensis)
				gt="Q903"
				;;
			pglauca)
				gt="WS77111"
				;;
			pengelmannii)
				gt="Se404-851"
				;;
		esac
	case $1 in
		[Pp][Gg]29|[Pp][Gg]|29)
			wd=$(echo "$dir" | sed "s/$current/interior_spruce/" | sed "s/$gt/PG29/")

			if [[ ! -d "$wd" ]]
			then
				echo -e "Interior spruce file:\n$wd"
				return
			fi
			if [[ -e "$wd" ]]
			then
				cd $wd
				echo -e "Directory changed to:\n$wd"
			else
				echo -e "This directory does not exist yet for PG29:\n$wd"
				read -p "Create this directory? " response
				if [[ "$response" == [Yy]* ]]
				then
					mkdir -p $wd
					echo "Directory created."
					cd $wd
					echo -e "Directory changed to:\n$wd"
				else
					echo "Directory not created."
				fi
			fi
			;;
		[Qq]903|[Qq]|903)
			wd=$(echo "$dir" | sed "s/$current/psitchensis/" | sed "s/$gt/Q903/")
			if [[ ! -d "$wd" ]]
			then
				echo -e "Sitka spruce file:\n$wd"
				return
			fi
			if [[ -e "$wd"  ]]
			then
				cd $wd
				echo -e "Directory changed to:\n$wd"
			else
				echo -e "This directory does not exist yet for Q903:\n$wd"
				read -p "Create this directory? " response
				if [[ "$response" == [Yy]* ]]
				then
					mkdir -p $wd
					echo "Directory created."
					cd $wd
					echo -e "Directory changed to:\n$wd"
				else
					echo "Directory not created."
				fi

			fi
			;;
		[Ww][Ss]77111|[Ww][Ss]|77111)
			wd=$(echo "$dir" | sed "s/$current/pglauca/" | sed "s/$gt/WS77111/")
			if [[ ! -d "$wd" ]]
			then
				echo -e "White spruce file:\n$wd"
				return
			fi
			if [[ -e "$wd" ]]
			then
				cd $wd
				echo -e "Directory changed to:\n$wd"
			else
				echo -e "This directory does not exist yet for WS77111:\n$wd"
				read -p "Create this directory? " response
				if [[ "$response" == [Yy]* ]]
				then
					mkdir -p $wd
					echo "Directory created."
					cd $wd
					echo -e "Directory changed to:\n$wd"
				else
					echo "Directory not created."
				fi

			fi
			;;
		[Ss][Ee]404-851|[Ss][Ee]|404|404-851)
			wd=$(echo "$dir" | sed "s/$current/pengelmannii/" | sed "s/$gt/Se404-851/")
			if [[ ! -d "$wd" ]]
			then
				echo -e "Engelmann spruce file:\n$wd"
				return
			fi
			if [[ -e "$wd" ]]
			then
				cd $wd
				echo -e "Directory changed to:\n$wd"
			else
				echo -e "This directory does not exist yet for Se404-851:\n$wd"
				read -p "Create this directory? " response
				if [[ "$response" == [Yy]* ]]
				then
					mkdir -p $wd
					echo "Directed created."
					cd $wd
					echo -e "Directory changed to:\n$wd"
				else
					echo "Directory not created."
				fi
			fi
			;;
	esac
}

# CD TO DIRNAME OF GIVEN FILE
function cdd() {
	if [[ "$1" == */ ]]
	then
		arg=$(echo $1 | sed 's/\/$//')
	else
		arg=$1
	fi
	if [[ ! -d "$arg" ]]
	then
		if [[ -L "$arg" ]]
		then
			dir=$(dirname $(readlink -f $arg))
		else
			dir=$(dirname $arg)
		fi
	else
		if [[ -L "$arg" ]]
		then
			dir=$(readlink -f $arg)
		else
			dir=$arg
		fi
	fi

	cd $dir
}

# FIND MAX
function max() {
	if [[ -z "$1" ]]
	then
		file=$(cat)
	else
		file=$1
	fi

	echo "$file" | sort -g -r | head -n1
}

# FIND MIN
function min() {
	if [[ -z "$1" ]]
	then
		file=$(cat)
	else
		file=$1
	fi

	echo "$file" | sort -g | head -n1
}

# COPY TO NEW EXT
function cpy() {
	file=$1
	ext=$2
	if [ ! -z "$ext" ]
	then
		cp $file{,-$ext}
	fi
}
# CONVERT SAM TO BAM, SORT, THEN INDEX
function bam() {
	if [[ -z "$1" ]]
	then
		sam=$(cat)
		echo "$sam" | samtools view -b -@ 128 | samtools sort -@ 128 > alignment.sorted.bam
		samtools index -@ 128 alignment.sorted.bam
	else
		sam=$1
		filename=$(getName $sam)
		samtools view -b -@ 128 $sam | samtools sort -@ 128 > ${filename}.sorted.bam
		samtools index -@ 128 ${filename}.sorted.bam
	fi
}

# UNLINK DIRECTORIES
function uln() {
	dir=$(echo $1 | sed 's/\/$//')
	unlink $dir
}

# ADD X NUMBER OF Ns
function putN() {
	for i in $(seq 1 $1)
	do
		echo -n "N"
	done
}
# PRINT NUMBER OF Ns
function getN() {
	seqtk comp $1 | awk '{print $9}'
}

# ACTIVATE JUPYTER NOTEBOOK
function jn() {
	cd ~
	jupyter notebook --no-browser --ip=0.0.0.0
}

# JIRA FORMAT OUTPUT
function jira() {
	if [[ -z "$1" ]]
	then
		file=$(cat)
		if [[ "$(echo "$file" | head -n1)" =~ [0-9]+ ]]
		then
			echo "$file" | sed 's/\t/|/g' | sed 's/^/|/' | sed 's/$/|/'
		else
			echo "$file" | head -n1 | sed 's/\t/||/g' | sed 's/^/||/' | sed 's/$/||/'
			echo "$file" | tail -n +2 | sed 's/\t/|/g' | sed 's/^/|/' | sed 's/$/|/'
		fi
	else
		file=$1
		if [[ "$(head -n1 $file)" =~ [0-9]+ ]]
		then
			cat $file | sed 's/\t/|/g' | sed 's/^/|/' | sed 's/$/|/'
		else
			head -n1 $file | sed 's/\t/||/g' | sed 's/^/||/' | sed 's/$/||/'
			tail -n +2 $file | sed 's/\t/|/g' | sed 's/^/|/' | sed 's/$/|/'
		fi
	fi
}

#function jira() {
#	file=$1
#	cat $file |tr '\t' \| | perl -ne 'chomp; if(!defined $ct){@a=split(/\|/); print "||"; foreach my $e (@a){print "$e||"} print "\n";$ct=1;} else{print "|$_|\n";} '
#}

# LENGTH OF SEQUENCE
function len() {
	fasta=$1
	if [[ "$(grep -c '^>' $fasta)" -eq 1 ]]
	then
		seqtk comp $fasta | awk '{print $2}'
	elif [[ "$(grep -c '^>' $fasta)" -gt 1 ]]
	then
		seqtk comp $fasta | awk 'BEGIN{OFS="\t"; print "Sequence\tLength"}{print $1, $2}' | tsv
	fi
	#tail -n 1 $fasta | head -c -1 | wc -m
}

# GET FASTA HEADER NAME
function id() {
	fasta=$1
	awk '/^>/ {print $1}' $fasta | sed 's/^>//g'
}

# GET LETTER COUNT
function lc() {
	echo -n "$1" | wc -m
}

# RETURNS PROTEIN NAME GIVEN PARTIAL NAME, I.E. SEARCHING BY SCAFFOLD IN A TRANSCRIPT FILE, CAN BE INFILED TO SEQTK SUBSEQ
function partial() {
	file=$1
	shift
	kw=$@
	for i in ${kw[@]}
	do
		grep $i $file | awk -F ">" '{print $2}' | awk '{print $1}'
	done | seqtk subseq $file -
}
# SAME AS S2T BUT RETURNS WHOLE LINE
# function s2l() {
# 	file=$1
# 	shift
# 	kw=$@
# 	for i in ${kw[@]}
# 	do
# 		grep $i $file | awk -F ">" '{print $2}'
# 	done
# }
# SAME AS SEQTK SUBSEQ, BUT CAN BE SEARCHED WITH PARTIAL NAME (SIMILAR TO ABOVE)
# function partial() {
# 	file=$1
# 	shift
# 	kw=$@
# 	for i in ${kw[@]}
# 	do
# 		awk -v var="$i" '$0 ~ var {x=NR+1}(NR<=x){print}' $file
# 	done
# }
# SEQUENCE COUNT
function sc() {
	file=$1
	grep -c '^>' $file
}

# GET REVERSE COMPLEMENT
function rc() {
	sequence=$1
	tail -n 1 <(seqtk seq -r <(echo -e ">header\n$1"))
}

# GET READ LENGTH
function pet() {
	hiseq=$1
	for line in $(cat $hiseq)
	do
		count=$(head -n 4 <(gunzip -c $line) | awk 'NR==2 {print}' | wc -m); echo -e "$(basename $line) $count"
	done
}

# SUM NUMBERS
function add() {
	numbers=$@
	sum=0
	for num in ${numbers[@]}
	do
		sum=$((sum+num))
	done
}

# CONVERT ONE LINER TO R VECTOR
function vector() {
	if [[ -p "/dev/stdin" && "$#" -lt 1 ]]
	then
		cat | sed 's/ /", "/g' | sed 's/^/c("/' | sed 's/$/")/'
	elif [[ "$1" == "/dev/fd/63" ]]
	then
		cat $1 | sed 's/ /", "/g' | sed 's/^/c("/' | sed 's/$/")/'
	else
		echo "$*" | sed 's/ /", "/g' | sed 's/^/c("/' | sed 's/$/")/'
	fi
}

# GET LINE OF FILE GIVEN LINE NUMBER
function line() {
	if [[ "$#" -ne 2 ]]
	then
		echo "line <LINE NUMBER> <FILE>"
		return
	else
		num=$1
		file=$2
		awk -v var="$num" 'NR==var' $file
	fi
}


# SEARCH FOR TOOLNAME IN LINUXBREW
function search() {
	if [[ "$#" -ne 1 ]]
	then
		echo "search <TOOL NAME>" 1>&2
		return
	fi
		grep -i $1 <(ls /gsc/btl/linuxbrew/bin)
}

#------------------------------------------------------------------------------#
#                             CONDA SETUP FOR LINUX                            #
#------------------------------------------------------------------------------#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/projects/btl/dlin/src/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/projects/btl/dlin/src/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/projects/btl/dlin/src/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/projects/btl/dlin/src/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# conda config --set auto_activate_base false

#------------------------------------------------------------------------------#
#                                  MAC STARTUP                                 #
#------------------------------------------------------------------------------#
#	cd /projects/amp/peptaid
#	cd /projects/amp/hackathon20
cd /projects/amp/rAMPage
/usr/bin/resize &> /dev/null
if [[ "$HOSTNAME" != xfer* ]]
then
	source /projects/amp/peptaid/scripts/config-dlin.sh
fi
#------------------------------------------------------------------------------#
#                                 BOTH STARTUPS                                #
#------------------------------------------------------------------------------#
# MAN PAGE COLOR CODING
export LESS_TERMCAP_mb=$'\E[01;31m'
# export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\E[01;33m'
# export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\E[0m'
# export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\E[0m'
# export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
# export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\E[0m'
# export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
# export LESS_TERMCAP_us=$'\e[1;4;31m'

# READ/WRITE PERMISSIONS FOR GROUP
umask ug+rw
