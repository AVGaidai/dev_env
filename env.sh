
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
echo "(load-theme 'wheatgrass)" >> ~/.emacs   # color theme
echo "alias emacs='emacs -nw'" >> ~/.bashrc   # -nw=no-window (text mode) 

# gitk -- The git repository browser
sudo dnf -y install gitk



