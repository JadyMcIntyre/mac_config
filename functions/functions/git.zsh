# Git Functions:

# uncommit accidental commit to main
fm(){
	gcm
	git reset HEAD~1
}

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

    # Validate source
    if ! git rev-parse --verify "$source" >/dev/null 2>&1; then
        echo "Error: '$source' is not a valid branch or commit hash."
        return 1
    fi

    # Use git to list changed files
    changed_files=$(git status --porcelain | sed -E 's/^.{3}//')
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

    # Validate file path
    if ! git ls-files --error-unmatch "$file_path" >/dev/null 2>&1; then
        echo "Error: '$file_path' is not a tracked file."
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
com() {
	# Get the list of files with changes (modified, staged, or untracked)
	changed_files=$(git status --porcelain | awk '{print $2}')
	if [ -z "$changed_files" ]; then
		echo "No changed files to commit."
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

	# Confirm that files have been staged
	staged_files=$(git diff --cached --name-only)
	if [ -z "$staged_files" ]; then
		echo "No files staged. Aborting commit."
		return 1
	fi

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
		# Optionally unstage files if commit is aborted
		git reset
	fi
}

# ---------------------------
