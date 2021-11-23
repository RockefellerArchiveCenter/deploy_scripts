# deploy_scripts
Bash scripts used in automated deployments.

## Usage
These scripts are intended to be used in conjunction with AWS CodeDeploy to
implement continuous deployment, and currently focus on Django and React applications.

Depending on the user that runs these scripts, additional modifications may need
to be made to allow that user to execute scripts with `sudo` permissions.

It is assumed that applications are served up via Apache.

## Environment Variables
The following environment variables are required by these scripts:
- APPLICATION_NAME (stop_cron.sh)
- APPLICATION_PORT (curl_index.sh, curl_status_endpoint.sh)
- ROOT_DIR (install_dependencies_django.sh, run_management_commands_django.sh, set_permissions.sh)
- PYTHON_PATH (install_dependencies_django.sh)

If you are using a subset of these scripts it may not be necessary to supply
all of these environment variables. For example, when deploying a React application,
it is not necessary to specify PYTHON_PATH.

## License
This code is released under the MIT License. See `LICENSE.md` for more information.
