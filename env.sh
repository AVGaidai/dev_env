OS=$(cat /etc/os-release | grep -woi "NAME=[A-Za-z0-9\-_]*")
OS=$(echo ${OS#NAME=*})

case "$OS" in

    "CentOS Linux" | "centos linux" | "CENTOS LINUX" )
    
	PM="yum"
    
    ;;
    
    "Fedora" | "FEDORA" | "fedora" )
    
	PM="dnf"
    ;;
    
    *)
    
	echo "Unknown Operation System!"
	exit 0
    ;;
esac



# Update system
sudo $PM -y update

sudo $PM -y install gcc     
sudo $PM -y install gcc-c++  
sudo $PM -y install clang    
sudo $PM -y install gdb      
sudo $PM -y install pkgconfig      
sudo $PM -y install valgrind 
sudo $PM -y install binutils     #gprof
sudo $PM -y install make     
sudo $PM -y install automake     
sudo $PM -y install autoconf
sudo $PM -y install libtool
sudo $PM -y install doxygen  
sudo $PM -y install vim      
sudo $PM -y install mc

# Emacs -- GNU project Emacs
sudo $PM -y install emacs

# Initialization Emacs
if ! [ -f ~/.emacs ] ; then
    echo -e "\n(package-initialize)
             (custom-set-variables
             '(package-selected-packages (quote (caps-lock))))
             (custom-set-faces)" > ~/.emacs
    echo "Created initializer for Emacs ~/.emacs"
fi

grep "load-theme" ~/.emacs
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\n(load-theme 'wheatgrass)" >> ~/.emacs # color theme
    echo "Add load-theme 'wheatgrass' for Emacs"
fi

grep "alias emacs" ~/.bashrc
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\nalias emacs='emacs -nw'" >> ~/.bashrc # -nw=no-window (text mode) 
    echo "Add alias for emacs: emacs -nw"
fi

grep "column-number-mode" ~/.emacs
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\n(setq column-number-mode t)" >> ~/.emacs # display column number
    echo "Add column-number-mode true for Emacs"
fi

grep "c-default-style" ~/.emacs
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\n(setq c-default-style \"cc-mode\")" >> ~/.emacs # default C style
    echo "Add c-default-style \"cc-mode\""
fi

grep "indent-tabs-mode" ~/.emacs
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\n(setq-default indent-tabs-mode nil)" >> ~/.emacs # no tabs
    echo "Add indent-tabs-mode nil"
fi

# Max length of line (80 characters)
grep "whitespace-line-column" ~/.emacs
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\n(require 'whitespace)
             (setq whitespace-line-column 80)
             (setq whitespace-style '(face lines-tail))
             (add-hook 'prog-mode-hook 'whitespace-mode)" >> ~/.emacs
    echo "Add whitespace-line-column foe Emacs"
fi

grep "global-set-key (kbd \"C-?\")" ~/.emacs
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\n(global-set-key (kbd \"C-?\") 'help-command)" >> ~/.emacs
    echo "set key C-? to help-command"
fi

grep "global-set-key (kbd \"C-h\")" ~/.emacs
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\n(global-set-key (kbd \"C-h\") 'delete-backward-char)" >> ~/.emacs
    echo "set key C-h to delete-backward-char"
fi

# gitk -- The git repository browser
sudo $PM -y install gitk



