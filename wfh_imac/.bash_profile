# export PS1="\[\033[1;36m\]\u\[\033[33m\]@\[\033[35m\]\h\[\033[33m\]:\[\033[34m\]\w\[\033[32m\]$ "
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad
# alias ls='ls -GFh'
# added by Anaconda3 4.4.0 installer
# export PATH="/Users/dianalin/anaconda/bin:$PATH"

if [ -f ~/.bashrc ]
then
	source ~/.bashrc
fi

##
# Your previous /Users/dianalin/.bash_profile file was backed up as /Users/dianalin/.bash_profile.macports-saved_2018-10-16_at_20:42:00
##

# MacPorts Installer addition on 2018-10-16_at_20:42:00: adding an appropriate PATH variable for use with MacPorts.
# export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# ##   __     __   __           ___
# ##  |__) | /  \ /__` \ / |\ |  |   /\  \_/
# ##  |__) | \__/ .__/  |  | \|  |  /~~\ / \
# ##  =======================================
# ##
# ## Syntax Highlighting for computational biology bp.append
# ## v0.1
# ##
# ## Append this to your ~/.bashprofile in MacOS
# ## to enable source-highlight for less and add
# ## bioSyntax pipe capability on your command line
# ##
# #export HIGHLIGHT="/usr/local/opt/source-highlight/share/source-highlight"
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

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

