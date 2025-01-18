# Create soft links for some files in this folder to the relevant location
# This script is created for a standard Debian Trixie (13)

set -e


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo SCRIPT_DIR=$SCRIPT_DIR


echo "Linking bashrc, vimrc, and pythonrc"
ln -s $SCRIPT_DIR/bashrc $HOME/.bashrc
ln -s $SCRIPT_DIR/vimrc $HOME/.vimrc
ln -s $SCRIPT_DIR/pythonrc $HOME/.pythonrc


echo "Linking ctags"
mkdir $XDG_CONFIG_HOME/ctags
ln -s $SCRIPT_DIR/ctags $XDG_CONFIG_HOME/ctags/config.ctags


echo "Linking venv-tool and pycache-remover"
mkdir -p $HOME/.local/bin
ln -s $SCRIPT_DIR/venv-tool.sh $HOME/.local/bin/venv-tool
ln -s $SCRIPT_DIR/pycache-remover.sh $HOME/.local/bin/pycache-remover


echo "Copying ssh and sshd config files"
SSH_FOLDER=/etc/ssh
sudo cp $SCRIPT_DIR/ssh_config $SSH_FOLDER/ssh_config
sudo cp $SCRIPT_DIR/sshd_config $SSH_FOLDER/sshd_config
