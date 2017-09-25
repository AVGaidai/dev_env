# Update system
sudo dnf -y update

sudo dnf -y install gcc     
sudo dnf -y install gcc-c++  
sudo dnf -y install clang    
sudo dnf -y install gdb      
sudo dnf -y install pkgconfig      
sudo dnf -y install valgrind 
sudo dnf -y install binutils     #gprof
sudo dnf -y install make     
sudo dnf -y install automake     
sudo dnf -y install autoconf
sudo dnf -y install libtool
sudo dnf -y install doxygen  
sudo dnf -y install vim      
sudo dnf -y install mc

# emacs -- GNU project Emacs
sudo dnf -y install emacs

# initialization Emacs
if ! [ -f ~/.emacs ] ; then
    echo -e "\n(package-initialize)
             (custom-set-variables
             '(package-selected-packages (quote (caps-lock))))
             (custom-set-faces)" > ~/.emacs
    echo "Created initializer for Emacs ~/.emacs"
fi

# Bind key "C-x ;" -- comment line
grep "comment-line" ~/.emacs
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\n(global-set-key (kbd \"C-x ;\") 'comment-line)" >> ~/.emacs
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

# gitk -- The git repository browser
sudo dnf -y install gitk



