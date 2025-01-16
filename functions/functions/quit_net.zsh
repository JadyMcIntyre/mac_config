kn() {
    PID=$(ps -ax | grep "/Applications/Netskope" | grep -v "grep" | awk '{print $1}')

    # Check if PID is not empty
    if [ -n "$PID" ]; then
        echo "Killing process with PID: $PID"
        kill "$PID"
        echo "Process terminated."
    else
        echo "No matching process found"
    fi
}
