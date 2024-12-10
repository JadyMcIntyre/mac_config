# Git Functions:

# restore file to main
# Usage: rf <path>
rf() {
	# Prompt the user to select the source
	echo "Select the source:"
	echo "1) main"
	echo "2) commit hash"
	read -p "Enter your choice (1 or 2): " choice

	case $choice in
		1)
			source="main"
			;;
		2)
			read -p "Enter the commit hash: " commit_hash
			if [ -z "$commit_hash" ]; then
				echo "Error: No commit hash provided."
				return 1
			fi
			source="$commit_hash"
			;;
		*)
			echo "Invalid choice. Please enter 1 or 2."
			return 1
			;;
	esac

	# Prompt the user to provide the file path
	read -p "Enter the file path to restore: " file_path

	if [ -z "$file_path" ]; then
		echo "Error: No file path provided."
		return 1
	fi

	# Perform the git restore operation
	git restore --source="$source" "$file_path"
	if [ $? -eq 0 ]; then
		echo "Successfully restored '$file_path' from '$source'."
	else
		echo "Failed to restore '$file_path' from '$source'."
		return 1
	fi
}

# ---------------------------
