# File containing functions that save my mac configs
save_functions() {
    cd ~/Developer/mac_config

    cp -r ~/.zsh/functions ./functions

    git add .
    if ! git diff --cached --quiet; then
	    source ~/.zshrc
	    git commit -m "functions backup"
	    git push origin main
    fi

    cd
}

save_zshrc() {
    cd ~/Developer/mac_config

    cp ~/.zshrc ./zsh/zshrc

    git add .
    if ! git diff --cached --quiet; then
	source ~/.zshrc
        git commit -m "zshrc backup"
        git push origin main
    fi

    cd
}

save_nvim() {
    cd ~/Developer/mac_config

    cp -r ~/.config/nvim ./nvim

    git add .
    if ! git diff --cached --quiet; then
	source ~/.zshrc
        git commit -m "nvim backup"
        git push origin main
    fi

    cd
}
