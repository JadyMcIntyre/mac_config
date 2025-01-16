# My MacBook Configurations  
A repo for all my macOS configuration settings and tools. This includes **zsh functions**, **zshrc**, and **Neovim setup**.

<details>
<summary>📁 <strong>Zsh Functions</strong></summary>
  
<br>Your custom zsh functions are located in:  
`~/.zsh/functions`

### ⚙️ Ensure Proper Permissions  
Make sure the functions are readable by running:  
```bash
chmod +r ~/.zsh/functions/*.zsh
```
### 📌 Important:
- All function files should have the .zsh extension. <br>
- in you `~/.zshrc` ensure you have the following code:
```bash
# Source all custom functions
for func_file in ~/.zsh/functions/*.zsh; do
  source "$func_file"
done
```
</details>

<details>
<summary>🔧 <strong>Zsh Configuration (zshrc)</strong></summary>
  
<br>Your zsh configuration file should be in:
`~/.zshrc`
</details>

<details>
<summary>✨ <strong>Neovim Setup</strong></summary>
  
<br>Your Neovim configuration should be stored in:
`~/.config/nvim`
</details>

## Happy configuring! 🚀
