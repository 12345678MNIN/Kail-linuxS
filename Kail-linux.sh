#!/bin/bash

clear
echo "Updating packages..."
pkg update -y && pkg upgrade -y

echo "Installing tools to simulate Kali Linux..."
pkg install -y nmap hydra netcat curl wget git nano

echo "Configuring the Kali Linux prompt..."
PS1='\033[01;31m\u@\h\033[00m:\033[01;34m\w\033[00m\$ '

echo "Creating folder structure similar to Kali Linux..."
mkdir -p ~/kali_simulation/{bin,tools,scripts}

echo "Welcome to Kali Linux (simulation) on Termux"
echo "Use 'exit' to quit or 'help' to see available commands."

function show_help {
  echo "Available commands:"
  echo "  - nmap [options]        # Network scanner"
  echo "  - hydra [options]       # Brute force tool"
  echo "  - netcat [options]      # Network tool"
  echo "  - git clone <url>       # Clone repositories"
  echo "  - scripts/autorun.sh    # Example script"
}

echo "Creating example script..."

cat > ~/kali_simulation/scripts/autorun.sh << EOF
#!/bin/bash
echo "Simulating a Kali Linux script!"
echo "This script can be used to automate tasks."
EOF

chmod +x ~/kali_simulation/scripts/autorun.sh

while true; do
    echo -n "KaliLinux@Termux:~\$ "
    read user_input

    case $user_input in
        "exit")
            echo "Exiting simulated Kali Linux..."
            break
            ;;
        "help")
            show_help
            ;;
        "scripts/autorun.sh")
            ~/kali_simulation/scripts/autorun.sh
            ;;
        *)
            echo "Command not found. Type 'help' to see available commands."
            ;;
    esac
done
