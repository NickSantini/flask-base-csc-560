#!/bin/bash

# update 
apt-get update

# install extra python packages
apt-get install -y python3 python-dev python3-dev build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev python-pip

#install sass
apt-get install -y sass

#install redis server
apt-get install -y redis-server

#install postgress mysql
apt-get install -y libpq-dev

if [ -f ./config.env ]; then
	echo "config.env already exists"
else
	# create environment config 
	touch ./config.env 

	# add secret key
	echo -n SECRET_KEY= >> ./config.env && python3 -c "import secrets; print(secrets.token_hex(16))" >> ./config.env
fi

# install python packages
pip install -r ./requirements.txt

# create database
python3 ./manage.py setup_dev


