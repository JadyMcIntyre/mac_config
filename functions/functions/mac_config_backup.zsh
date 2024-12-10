# File containing functions that save my mac configs
save_functions() {
	cd ~/Developer/mac_config

	cp -r ~/.zsh/functions ./functions

	git add .
	git commit -m "functions backup"
	git push origin main

	cd
}

save_zshrc() {
	cd ~/Developer/mac_config

	cp ~/.zshrc ./zsh/zshrc

	git add .
	git commit -m "zshrc backup"
	git push origin main

	cd
}

save_nvim() {
	cd ~/Developer/mac_config

	cp -r ~/.config/nvim ./nvim

	git add .
	git commit -m "nvim backup"
	git push origin main

	cd
}
