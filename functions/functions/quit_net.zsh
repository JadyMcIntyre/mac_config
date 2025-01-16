kn(){
	# Search for the app and extract the PID
	PID=$(kn | grep "/Applications/Netskope" | awk '{print $1}')

	# Check if PID is not empty
	if [ -n "$PID" ]; then
		echo "Killing process with PID: $PID"
		kill "$PID"
		echo "Process terminated."
	else
		echo "No matching process found for Net"
	fi
}
