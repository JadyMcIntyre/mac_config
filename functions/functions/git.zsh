# Git Functions:

# restore file to main
# Usage: gr <path>
gr() {
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

	# Use git to list changed files
	changed_files=$(git status --porcelain | awk '{print $2}')
	if [ -z "$changed_files" ]; then
		echo "No changed files to restore."
		return 1
	fi

	# Use gum to let the user select a file
	file_path=$(echo "$changed_files" | gum choose --no-limit --header="Select the file to restore")

	if [ -z "$file_path" ]; then
		echo "Error: No file selected."
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

# Create a commit
gc() {
	# Use git to list all changed files
	changed_files=$(git status --porcelain | awk '{print $2}')
	if [ -z "$changed_files" ]; then
		echo "No changed files to stage."
		return 1
	fi

	# Use gum to let the user select files to stage
	files_to_add=$(echo "$changed_files" | gum choose --no-limit --header="Select files to stage")

	if [ -z "$files_to_add" ]; then
		echo "No files selected. Aborting commit."
		return 1
	fi

	# Stage the selected files
	git add $files_to_add

	# Proceed to the commit process
	TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
	SCOPE=$(gum input --placeholder "scope")

	# Since the scope is optional, wrap it in parentheses if it has a value.
	test -n "$SCOPE" && SCOPE="($SCOPE)"

	# Pre-populate the input with the type(scope): so that the user may change it
	SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
	DESCRIPTION=$(gum write --placeholder "Details of this change")

	# Commit these changes if the user confirms
	if gum confirm "Commit changes?"; then
		git commit -m "$SUMMARY" -m "$DESCRIPTION"
		gum style --foreground="green" "Changes committed successfully!"
	else
		gum style --foreground="red" "Commit aborted."
	fi
}
# ---------------------------
