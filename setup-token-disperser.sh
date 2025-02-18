#!/bin/bash

# Update package lists and install curl if not installed
echo "Checking if curl is installed..."
if ! command -v curl &> /dev/null
then
    echo "curl not found. Installing..."
    sudo apt update && sudo apt install -y curl
else
    echo "curl is already installed."
fi

# Install Git if not installed
echo "Checking if git is installed..."
if ! command -v git &> /dev/null
then
    echo "git not found. Installing..."
    curl -sSL https://raw.githubusercontent.com/CryptoAirdropHindi/Tools/refs/heads/main/git.sh | bash
else
    echo "git is already installed."
fi

# Clone the repository
echo "Cloning token-disperser repository..."
git clone https://github.com/CryptoAirdropHindi1/token-disperser.git && cd token-disperser

# Install Node.js and npm
echo "Installing Node.js and npm..."
curl -sSL https://raw.githubusercontent.com/CryptoAirdropHindi/Tools/refs/heads/main/node.sh | bash

# Install required dependencies
echo "Installing necessary dependencies..."
npm install enquirer@2.4.1 ethers@6.13.5 node-fetch@3.3.2 ora@5.4.1

# Prompt user to input wallet addresses
echo "Please input wallet addresses into address.txt (one address per line)..."
nano address.txt

# Confirm the user wants to start sending tokens
echo "Ready to start sending tokens! To proceed, use the following command:"
echo "node bot.js"
echo "When prompted, answer ⛽ 'y' for customized gas fee, or 'N' for current gas fee."

# Prompt the user to start the bot
read -p "Do you want to start the bot now? (y/N): " start_bot
if [ "$start_bot" == "y" ] || [ "$start_bot" == "Y" ]; then
    echo "Starting the bot..."
    node bot.js
else
    echo "Setup completed. You can start the bot manually later with 'node bot.js'."
fi
