# update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# install python3-venv if not installed
sudo apt install python3-venv python3-pip -y


# make project directory
WORKING_DIR=/home/gtr/service_gtr_app_telegram
sudo mkdir -p ${WORKING_DIR}
cd ${WORKING_DIR}


# create and activate a virtual environment
sudo python3 -m venv .venv
source .venv/bin/activate


# required packages
pip install python-telegram-bot 

# optional packages
pip install fastapi[all]
pip install uvicorn
pip install pymongo
pip install jupyter
pip install pillow
pip install opencv-python-headless


