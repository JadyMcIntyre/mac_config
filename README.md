# Jady's MacBook Configurations  
A repository for all my macOS configuration settings and tools. This includes **zsh functions**, **zshrc**, and **Neovim setup**.

---

## 📁 **Zsh Functions**  
Your custom zsh functions are located in:  
`~/.zsh/functions`

### ⚙️ Ensure Proper Permissions  
Make sure the functions are readable by running:  
```bash
chmod +r ~/.zsh/functions/*.zsh
```
### 📌 Important:
All function files should have the .zsh extension.

### ✏️ Usage:
in you `~/.zshrc` ensure that you have the following code:
```bash
# Source all custom functions
for func_file in ~/.zsh/functions/*.zsh; do
  source "$func_file"
done
```


## 🔧 Zsh Configuration (zshrc)
Your zsh configuration file should be in:
`~/.zshrc`


## ✨ Neovim Setup
Your Neovim configuration should be stored in:
`~/.config/nvim`

# Happy configuring! 🚀
