# ~/.bashrc: Bash configuration file
# Run this file every time a new Bash session starts

# ✅ 1. Set up a nice prompt
export PS1="\[\e[34m\]\u@\h \[\e[33m\]\w\[\e[0m\] $ "

# ✅ 2. Enable command history (saves previous commands)
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoredups
shopt -s histappend

# ✅ 3. Set default editor (change to 'vim' if preferred)
export EDITOR=nano

# ✅ 4. Add commonly used aliases
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"

# ✅ 5. Add Python virtual environment activation
alias activate_gcal='source ~/projects/google_calendar_automation/activate_project.sh'

# ✅ 6. Load Starship prompt (if installed)
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# ✅ 7. Apply changes
echo "✅ .bashrc loaded successfully!"

