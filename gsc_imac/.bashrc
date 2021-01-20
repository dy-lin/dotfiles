# .bashrc

#------------------------------------------------------------------------------#
#                                    ALIASES                                   #
#------------------------------------------------------------------------------#

alias ls='ls -hG'
alias dt='top -U dlin'
alias resize='COLUMNS=$(/usr/bin/tput cols) && LINES=$(/usr/bin/tput lines) && export COLUMNS LINES && echo "Resized."'
alias sed='/home/dlin/.homebrew/opt/gnu-sed/libexec/gnubin/gsed'
alias igv='/Users/dlin/src/IGV_2.8.0/igv.sh'
alias vim='/Users/dlin/vim/src/vim'
alias zoom='/Users/dlin/zoom.sh'

#------------------------------------------------------------------------------#
#                                     PATHS                                    #
#------------------------------------------------------------------------------#

IGV_MAC_PATH="~/src/IGV_2.8.0"
HOMEBREW_PATH="/home/dlin/.homebrew/bin"
OPENJDK_PATH="/home/dlin/.homebrew/opt/openjdk/bin"
export PATH="$OPENJDK_PATH:$HOMEBREW_PATH:$PATH:$IGV_MAC_PATH"

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
#                                  WINDOW SIZE                                 #
#------------------------------------------------------------------------------#
shopt -s checkwinsize

# Do not update homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

# Customize ls colours
export LSCOLORS=exgxcxdxcxegadabagacad

# Customize vim
export VIMRUNTIME=/Users/dlin/vim/runtime

# Mount volumes
cd /projects/amp/
cd /projects/btl/dlin
cd /home/dlin/Documents
cd /home/dlin/Desktop
cd /home/dlin

# Resize the window upon startup
resize > /dev/null
COLUMNS=$(/usr/bin/tput cols) && LINES=$(/usr/bin/tput lines) && export COLUMNS LINES

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
export LESSOPEN="| /home/dlin/.homebrew/bin/src-hilite-lesspipe.sh %s"
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
