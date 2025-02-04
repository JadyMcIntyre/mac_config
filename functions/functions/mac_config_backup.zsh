# A helper function to perform the backup.
# Arguments:
#   1. Source path (absolute)
#   2. Destination path (relative to ~/Developer/mac_config)
#   3. Commit message
#   4. cp flag (e.g. "-r" for directories, or empty for files)
#   5. Optional: if the string "reload" is passed, source ~/.zshrc after copying
backup() {
  local src="$1"
  local dest="$2"
  local commit_msg="$3"
  local cp_flag="$4"
  local reload="$5"

  # Change directory safely
  pushd ~/Developer/mac_config > /dev/null || return

  git add .
  if ! git diff --cached --quiet; then
    cp ${cp_flag} "$src" "$dest"
    [ "$reload" = "reload" ] && source ~/.zshrc
    git commit -m "$commit_msg"
    git push origin main
  fi

  popd > /dev/null
}

# Backup your custom functions (a directory)
save_functions() {
  backup ~/.zsh/functions functions "functions backup" -r reload
}

# Backup your zshrc file
save_zshrc() {
  backup ~/.zshrc zsh/zshrc "zshrc backup" "" reload
}

# Backup your nvim config (a directory)
save_nvim() {
  backup ~/.config/nvim nvim "nvim backup" -r
}
