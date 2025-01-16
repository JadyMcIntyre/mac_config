# Git Functions:

# restore file to main
# Usage: rf <path>
rf() {
	# Prompt the user to select the source using gum
	source=$(gum choose --header="Select the source:" "main" "commit hash")

	if [ -z "$source" ]; then
		echo "Error: No source selected."
		return 1
	fi

	if [ "$source" = "commit hash" ]; then
		# Prompt the user to enter the commit hash
		commit_hash=$(gum input --placeholder="Enter the commit hash")
		if [ -z "$commit_hash" ]; then
			echo "Error: No commit hash provided."
			return 1
		fi
		source="$commit_hash"
	fi

	# Prompt the user to provide the file path using gum
	file_path=$(gum input --placeholder="Enter the file path to restore")
	if [ -z "$file_path" ]; then
		echo "Error: No file path provided."
		return 1
	fi

	# Perform the git restore operation
	git restore --source="$source" "$file_path"
	if [ $? -eq 0 ]; then
		gum style --foreground="green" "Successfully restored '$file_path' from '$source'."
	else
		gum style --foreground="red" "Failed to restore '$file_path' from '$source'."
		return 1
	fi
}

# ---------------------------
