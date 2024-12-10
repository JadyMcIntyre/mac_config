# Save zsh
save_zshrc() {
	cd ~/Developer/mac_config

	cp ~/.zshrc ./zsh/zshrc

	git add .
	git commit -m "zshrc backup"
	git push origin main

	cd
}

# zsh
ez() {
	nvim ~/.zshrc
	source ~/.zshrc 
	save_zshrc
}

# nvim
ev() {
   nvim ~/.config/nvim/
}
