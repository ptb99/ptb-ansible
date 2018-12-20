# minimal root .cshrc

set prompt = "%m[%\!]# "

set history = 5000
set savehist = (1000 merge)
limit coredumpsize 0	# I never debug cores anyway

setenv LESS -MqedR
setenv PAGER less
setenv EDITOR vi


alias lsl "ls -al"
alias em  "emacs -nw"
alias h history
alias j "jobs -l"
alias m less
alias purge "rm -rf *~ .*~ #*# *.CKP"
alias pd pushd
alias pop popd
alias ppr 'enscript -2r --margins=72:::36 -F Times-RomanBold12 -P${PRINTER_Postscript}'
alias ssh-fix "ssh-keygen -f ~/.ssh/known_hosts -R "
alias ac apt-cache
alias ag apt-get
