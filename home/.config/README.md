
- [NeoVim と dein.vim を使ってみる!](http://qiita.com/Ress/items/7e71e007cf8d41a07a1a)


# setup

~~~bash
$ cd
$ mkdir -p .config ; cd .config 
$ ln -s bin/home/.config/nvim . 
$ ln -s bin/home/.config/dein . 
~~~



# いろいろ

- エラー

~~~bash
function dein#install[1]..dein#install#_update[54]..<SNR>10_install_blocking[11]..<SNR>10_done[9]..dein#install#_recache_runtimepath[36]..dein#remote_plugins[1]..dein#install#_remote_plugins[11]..remote#host#UpdateRemotePlugins[6]..<SNR>26_RegistrationCommands[13]..remote#host#Require[13]..provider#pythonx#Require, 行 13
Vim(let):E903: Could not spawn API job
function dein#install[1]..dein#install#_update[54]..<SNR>10_install_blocking[11]..<SNR>10_done[9]..dein#install#_recache_runtimepath[36]..dein#remote_plugins[1]..dein#install#_remote_plugins[11]..remote#host#UpdateRemotePlugins[6]..<SNR>26_RegistrationCommands[13]..remote#host#Require[13]..provider#pythonx#Require, 行 22
Failed to load python3 host. You can try to see what happened by starting Neovim with the environment variable $NVIM_PYTHON_LOG_FILE set to a file and opening the generated log file. Also, the host stderr will be available in Neovim log, so it may contain useful information. See also ~/.nvimlog.
remote/host: generated the manifest file in "/Users/hide/bin/home/.config/nvim/.init.vim-rplugin~"
[dein] Runtimepath updated: (2016/07/22 10:46:44)
~~~
