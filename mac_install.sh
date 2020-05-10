#xcode has a prompt and needs manual install
#xcode-select --install

#brew install
/usr/bin/ruby -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


brew install python3
brew install sass/sass/sass
brew install redis
brew install postgresql
brew install git

if [ -f ./config.env ]; then
	echo "config.env already exists"
else
	# create environment config
	touch ./config.env

	# add secret key
	echo -n SECRET_KEY= >> ./config.env && python3 -c "import secrets; print(secrets.token_hex(16))" >> ./config.env
fi

#these must be done in venv
# install python packages
#pip install -r ./requirements.txt

# create database
#python3 ./manage.py setup_dev
