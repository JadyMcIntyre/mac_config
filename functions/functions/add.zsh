save_functions() {
	cd ~/Developer/mac_config

	cp -r ~/.zsh/functions ./functions

	git add .
	git commit -m "functions backup"
	git push origin main

	cd
}

af() {
	nvim ~/.zsh/functions
	source ~/.zshrc
	save_functions
}
