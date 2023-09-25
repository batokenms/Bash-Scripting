import os

# Patch management
os.system("sudo apt update -y")
os.system("sudo apt upgrade -y")

# Clean cache and remove outdated packages
os.system("sudo apt autoremove -y")
os.system("sudo apt autoclean -y")

# Check if Maven is installed
if os.system("! command -v mvn > /dev/null 2>&1") != 0:
    print("Maven is not installed. Installing now.")
    os.system("sudo apt install maven -y")
else:
    print("Maven is already installed")

# Check if Java JDK 11 is installed
if os.system("! command -v java > /dev/null 2>&1 || ! java -version 2>&1 | grep -q '11\\.'") != 0:
    print("Java JDK 11 is not installed. Installing now.")
    os.system("sudo apt install openjdk-11-jdk -y")
else:
    print("Java JDK 11 is already installed")

# Check if Docker is installed and service is started and enabled
if os.system("! command -v docker > /dev/null 2>&1 || ! systemctl is-active --quiet docker") != 0:
    print("Docker is not installed or service is not started and enabled. Installing and starting now.")
    os.system("sudo apt install docker.io -y")
    os.system("sudo systemctl start docker")
    os.system("sudo systemctl enable docker")
else:
    print("Docker is already installed and service is started and enabled")

# Install remaining packages
packages_to_install = [
    ("ansible", "Ansible"),
    ("docker-compose", "Docker Compose"),
    ("terraform", "Terraform"),
    ("wget", "Wget"),
    ("curl", "Curl"),
]

for package_cmd, package_name in packages_to_install:
    if os.system("! command -v {} > /dev/null 2>&1".format(package_cmd)) != 0:
        print("{} is not installed. Installing now.".format(package_name))
        os.system("sudo apt install {} -y".format(package_cmd))
    else:
        print("{} is already installed".format(package_name))
