SERVICE_NAME=1riel_app_telegram

# restart service
sudo systemctl restart ${SERVICE_NAME}.service

# show live log
sudo journalctl -u ${SERVICE_NAME} -f -o short-iso
# -u: specify the service unit
# -f: follow live log output

