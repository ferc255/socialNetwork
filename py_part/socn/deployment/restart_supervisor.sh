#!/bin/bash
echo "Supervisor is being stopping..."
sudo service supervisor stop
echo "Supervisor is stoped"
sleep 2
echo "Touching uwsgi ini file"
sudo touch socn_uwsgi.ini
sleep 1
echo "Starting supervisor"
sudo service supervisor start
echo "Supervisor is started"
