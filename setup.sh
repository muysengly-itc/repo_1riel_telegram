########## UPDATE SYSTEM ##########

# update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# install python3-venv if not installed
sudo apt install python3-venv python3-pip -y

########## __________ ##########


# login to git via terminal (if required)
# git config --global user.name "your_username"
# git config --global user.email "muy.se


########## INSTALL ENVIRONMENT ##########

# create and activate a virtual environment
sudo python3 -m venv .venv
source .venv/bin/activate


# required packages
pip install python-telegram-bot 

########## __________ ##########


########## SETUP SERVICE ##########

# create systemd service file
SERVICE_NAME=service_1riel_telegram
WORKING_DIR=$(pwd)

cat <<EOF | sudo tee /etc/systemd/system/${SERVICE_NAME}.service > /dev/null
[Unit]
Description=${SERVICE_NAME}_service
After=network.target

[Service]
User=root
Type=simple
WorkingDirectory=${WORKING_DIR}
ExecStart=/bin/bash -c 'source ${WORKING_DIR}/.venv/bin/activate && python run.py'
StandardOutput=journal
StandardError=journal
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

# start systemd
sudo systemctl daemon-reload
sudo systemctl enable ${SERVICE_NAME}.service
sudo systemctl start ${SERVICE_NAME}.service

########## __________ ##########
