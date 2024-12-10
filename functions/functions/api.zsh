# API Functions:

api() {
  # Navigate to the API directory.
  cd outapp.webapi/OUTapp.WebApi

  # Default command and profile.
  local CMD="dotnet"
  local CMD_ARGS=("run")
  local PROFILE=()

  # Parse arguments.
  for arg in "$@"; do
    case "$arg" in
      test)
        PROFILE=(--launch-profile "OUTapp.WebApi TEST")
        ;;
      watch)
        CMD_ARGS=("watch" "run")
        ;;
      *)
        echo "Invalid argument: $arg"
        return 1
        ;;
    esac
  done

  # Execute the command.
  "$CMD" "${CMD_ARGS[@]}" "${PROFILE[@]}" --project ./OUTapp.WebApi.csproj
}
