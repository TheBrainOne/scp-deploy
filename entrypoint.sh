#!/bin/sh -l

# Import SSH key from Github secret then create a temporary key file
echo -e "${INPUT_SSH_KEY}" >./.github/workflows/_temp_ssh_key

# Change file access permissions.
chmod 600 ./.github/workflows/_temp_ssh_key

# Trying to deploy files from the repository to the server
# scp
# -o <ssh_option> : StrictHostKeyChecking - 
# -v : Display the operation’s execution step by step.
# -i <identity_file> : Sets file name of the private SSH key file.
# -P <port> : Connect to port on the remote host.
# -r : Copy recursively.
# Local path to files/folders
# username@host:path on the server where you want to deploy
scp -o StrictHostKeyChecking=no -v -i ./.github/workflows/_temp_ssh_key -P "${INPUT_PORT}" -r ${INPUT_LOCAL_PATH} "${INPUT_USERNAME}"@"${INPUT_HOST}":"${INPUT_SERVER_PATH}"

if ${INPUT_INIT_NPM} 
then ssh -p "${INPUT_PORT}" -i ./.github/workflows/_temp_ssh_key "${INPUT_USERNAME}"@"${INPUT_HOST}" "${INPUT_SERVER_PATH} && npm i"
fi