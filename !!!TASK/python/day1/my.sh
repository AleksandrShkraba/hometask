#!/bin/bash
curl -L  https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
cat <<add>> ~/.bashrc
export PATH="/home/$USERNAME/.pyenv/bin:$PATH"
add
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc
sudo yum install -y libffi-devel zlib-devel bzip2-devel readline-devel sqlite-devel wget curl llvm ncurses-devel openssl-devel lzma-sdk-devel redhat-rpm-config
pyenv install 3.7.0
pyenv install 2.7.0
pyenv global 3.7.0
pyenv virtualenv 3.7.0 env_for_3.7
pyenv virtualenv 2.7.0 env_for_2.7
pyenv activate env_for_3.7
