# magit-blog
magit blog related files and examples

To follow the examples of the blog, please install `emacs` (e.g. `brew install emacs` on macos, or `pacman -S emacs` on arch linux).

If you have emacs installed, you can execute `magit.sh` which will automatically start magit and ask you for the path to the repository to work with.

Alternatively you can checkout the `init.el` file of this repo into `~/.emacs.d` to make emacs run magit on startup. Use following commands to make this happen. IF YOU ALREADY HAVE A WORKING EMACS INSTALLATION, PLEASE DO NOT EXECUTE THE REMOVE COMMANDS!
```sh
# rm ~/.emacs       # remove any existing emacs configurations
# rm -R ~/.emacs.d  
mkdir ~/.emacs.d    # (re)create folder for configuration file
git clone git@github.com:gunther-bachmann/magit-blog.git ~/.emacs.d
emacs &
```

