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

# emacs -- GNU project Emacs
sudo dnf -y install emacs
grep "load-theme" ~/.emacs
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\n(load-theme 'wheatgrass)" >> ~/.emacs   # color theme
    echo "Add load-theme 'wheatgrass' for Emacs"
fi

grep "alias emacs" ~/.bashrc
status=$?
if [ $status -eq 1 ] ; then
    echo -e "\nalias emacs='emacs -nw'" >> ~/.bashrc   # -nw=no-window (text mode) 
    echo "Add alias for emacs: emacs -nw"
fi

# gitk -- The git repository browser
sudo dnf -y install gitk



