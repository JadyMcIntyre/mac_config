# ========================================
# Oh My Zsh Configuration
# ========================================

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Update automatically without asking
zstyle ':omz:update' mode auto      

# Uncomment one of the following lines to change the auto-update behavior:
# zstyle ':omz:update' mode disabled  # Disable automatic updates
# zstyle ':omz:update' mode reminder  # Remind me to update when it's time

# Set the auto-update frequency (in days, optional)
# zstyle ':omz:update' frequency 13

# Enable visual feedback (dots) while waiting for command completion
COMPLETION_WAITING_DOTS="true"

# ========================================
# NVM (Node Version Manager) Configuration
# ========================================
# Load NVM
source ~/.nvm/nvm.sh

# ========================================
# Plugins
# ========================================
# Load Oh My Zsh plugins
# Add plugins wisely as too many can slow down shell startup
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# ========================================
# User Configuration
# ========================================

# Set default editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Uncomment the following line if pasting URLs and other text is messed up
# DISABLE_MAGIC_FUNCTIONS="true"

# ========================================
# Aliases
# ========================================
# Define custom aliases here
# Example:
# alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="nvim ~/.oh-my-zsh"

# ========================================
# Paths
# ========================================
export PATH="/usr/local/Caskroom/flutter/3.13.6/flutter/bin:$PATH"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="/Users/JadyMcIntyre/bin:$PATH"

# ========================================
# Functions
# ========================================
# Source all custom functions
for func_file in ~/.zsh/functions/*.zsh; do
  source "$func_file"
done

# ========================================
# Starship Prompt Configuration
# ========================================
# Initialize Starship prompt
eval "$(starship init zsh)"

# ========================================
# Oh My Posh Prompt
# ========================================
# Initialize Oh My Posh prompt for non-Apple terminals and switch off for ssl
if [ "$TERM_PROGRAM" != "Apple_Terminal" ] && [ "$TERM" != "ssl" ]; then
	eval "$(oh-my-posh init zsh)"
fi
