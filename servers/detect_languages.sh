#!/bin/bash

# Initialize an associative array to hold language detection commands
declare -A languages

# Define language detection commands and their installation paths
languages=(
    ["Node.js"]="node"
    ["Python"]="python3"
    ["Go"]="go"
    ["Rust"]="rustc"
    ["Java"]="javac"
    ["C/C++"]="gcc"
)

# Initialize an array to hold the detected languages
detected_languages=()

# Check for each language and add it to the detected_languages array if found
for lang in "${!languages[@]}"; do
    if command -v "${languages[$lang]}" &> /dev/null; then
        detected_languages+=("$lang")
    fi
done

# Function to install Node.js LSP servers
install_node_servers() {
    npm install -g typescript-language-server eslint-language-server vscode-html-languageserver-bin vscode-css-languageserver-bin
}

# Function to install Python LSP servers
install_python_servers() {
    pip install pyright
}

# Function to install Go LSP servers
install_go_servers() {
    go install golang.org/x/tools/gopls@latest
}

# Function to install Rust LSP servers
install_rust_servers() {
    rustup component add rust-analyzer
}

# Function to install Java LSP servers
install_java_servers() {
    # You can add additional Java LSP server installations here
    echo "Java LSP server installation is not included in this script."
}

# Function to install C/C++ LSP servers
install_cpp_servers() {
    # Assume clangd is used for C/C++
    sudo apt-get install -y clangd
}

# Install LSP servers based on the detected languages
for lang in "${detected_languages[@]}"; do
    case "$lang" in
        "Node.js")
            echo "Installing Node.js language servers..."
            install_node_servers
            ;;
        "Python")
            echo "Installing Python language servers..."
            install_python_servers
            ;;
        "Go")
            echo "Installing Go language servers..."
            install_go_servers
            ;;
        "Rust")
            echo "Installing Rust language servers..."
            install_rust_servers
            ;;
        "Java")
            echo "Installing Java language servers..."
            install_java_servers
            ;;
        "C/C++")
            echo "Installing C/C++ language servers..."
            install_cpp_servers
            ;;
        *)
            echo "No server installation function defined for $lang."
            ;;
    esac
done

echo "Language server installation complete!"

