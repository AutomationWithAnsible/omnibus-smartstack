#!/usr/bin/env bash
set -e 
echo "******** SETUP ubuntu ********"
su vagrant -c '
whoami
sudo apt-get update
echo "PATH=$PATH"
echo "> apt-get install curl git -y"
sudo apt-get install curl git -y
echo "> curl -sSL https://rvm.io/mpapis.asc | gpg --import -"
sudo curl -sSL https://rvm.io/mpapis.asc | gpg --import -
echo "> curl -sSL https://get.rvm.io | bash -s stable"
sudo curl -sSL https://get.rvm.io | bash -s stable

PROJECT="smartstack"
echo "******** BUILD ubuntu ********"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

echo "> rvm reload"
rvm reload
echo "> rvm get head"
rvm get head
echo "> rvm install 2.2"
rvm install 2.2
rvm reset
rvm use ruby-2.2.2

echo "******** SETUP ubuntu ********"
echo "PATH=$PATH"
echo "> apt-get install curl git -y"
sudo apt-get install curl git -y
echo "> curl -sSL https://rvm.io/mpapis.asc | gpg --import -"
sudo curl -sSL https://rvm.io/mpapis.asc | gpg --import -
echo "> curl -sSL https://get.rvm.io | bash -s stable"
sudo curl -sSL https://get.rvm.io | bash -s stable

PROJECT="smartstack"
echo "******** BUILD ubuntu ********"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

echo "> rvm reload"
rvm reload
echo "> rvm get head"
rvm get head
echo "> rvm install 2.2"
rvm install 2.2
rvm reset
rvm use ruby-2.2.2


echo "> cd omnibus-$PROJECT"
cd $PROJECT
echo "> gem install bundle"
gem install bundle  --no-rdoc --no-ri
echo "> bundle install --binstubs"
bundle install --binstubs
old_hash="d7f7dd7e3ede3e323fc0e09381f16caf"
new_hash="380df856e8f789c1af97d0da9a243769"
pwd
echo "> sudo find / -name cacerts.rb -type f  -exec sed -i -e 's/d7f7dd7e3ede3e323fc0e09381f16caf/380df856e8f789c1af97d0da9a243769/g' {} \;"
sudo find / -name cacerts.rb  -type f  -exec sed -i -e 's/d7f7dd7e3ede3e323fc0e09381f16caf/380df856e8f789c1af97d0da9a243769/g' {} \;

sudo mkdir -p /opt/$PROJECT 
sudo mkdir -p /var/cache/omnibus
sudo chown vagrant  /var/cache/omnibus
sudo chown vagrant  /opt/$PROJECT 
echo "> omnibus build $PROJECT"
omnibus build $PROJECT 
'