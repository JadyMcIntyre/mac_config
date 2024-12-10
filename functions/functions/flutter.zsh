# Flutter Functions:

flutterPath() {
# used to fetch flutter path.
# usually after update.
lnk=$(readlink /usr/local/bin/flutter)
some_variable="$( echo "$lnk" | sed -e 's#/bin/flutter$##' )"
echo $some_variable | pbcopy
}

cd_fl() {
# used to go to flutter directory
cd

cd /Users/JadyMcIntyre/outapp.flutter/outsurance_mobile
}

fp() {
  # used to attempt to fix cocoapods errors
  cd_fl &&          # Only proceed if cd_fl succeeds
  cd ios &&         # Only proceed if 'cd ios' succeeds
  rm Podfile.lock && # Only proceed if 'rm Podfile.lock' succeeds
  pod install --repo-update && # Only proceed if 'pod install' succeeds

  echo "if it's still not working, try fp_b" 
  echo "or invalidate android studio's cache"
}

fr() {
  # Function to run Dart apps with configurations
  local env=$1

  if [[ "$env" == "local" ]]; then
	  # Run the local shell script
	  cd_fl &&
		  ./run_app_local.sh
		    elif [[ "$env" == "test" ]]; then
			    # Run Dart app with test configurations
			    local config_args="--dart-define env=tst \
				    --dart-define-from-file keys_local.json \
				    --dart-define log-network=true"

    cd_fl &&
	    flutter run --target=lib/main.dart \
	    --dart-define=env=tst \
	    --dart-define-from-file=keys_local.json \
	    --dart-define=log-network=false \
	    --flavor=tst
		else
			echo "Usage: fr <local|test> [dart_run_arguments]"
			return 1
  fi

  trap 'cd ' EXIT SIGINT SIGTERM
}

# -------------------------------
