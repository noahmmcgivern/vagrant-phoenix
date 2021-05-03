#!/bin/bash

# Install node version manager
{
    wget -q https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh
    bash install.sh
    rm install.sh
}

# Source scripts
{
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# Install node LTS
nvm install --lts --no-progress
