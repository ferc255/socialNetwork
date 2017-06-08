#!/bin/bash
sudo service supervisor stop
sleep 6
sudo touch socn_uwsgi.ini
sudo service supervisor start
