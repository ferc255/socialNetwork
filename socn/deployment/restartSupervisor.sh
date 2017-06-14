#!/bin/bash
sudo service supervisor stop
sleep 2
sudo touch socn_uwsgi.ini
sleep 1
sudo service supervisor start
sleep 1
