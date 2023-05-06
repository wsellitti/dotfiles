if [ -d "$HOME/.bin" ] ; then
	export PATH="$HOME/.bin":$PATH
fi

if [ -d "$HOME/.local/bin" ] ; then
	export PATH="$HOME/.local/bin":$PATH
fi

if [ -d "$HOME/.cache" ] ; then
	export XDG_CACHE_HOME="$HOME/.cache"
fi 

if [ -d "$HOME/.config" ] ; then
	export XDG_CONFIG_HOME="$HOME/.config"
fi

if [ -d "$HOME/.local/share" ] ; then
	export XDG_DATA_HOME="$HOME/.local/share"
fi

export VISUAL=/usr/bin/vim
export EDITOR=$VISUAL
export SVN_EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL

if [ $SHELL='/bin/bash' ] ; then
	if [ -x $HOME/.bashrc ] ; then
		source $HOME/.bashrc
	fi
fi

if [ -f "${HOME}/Ansible/config/ansible.cfg" ];then
	export ANSIBLE_CONFIG="${HOME}/Ansible/config/ansible.cfg"
fi

