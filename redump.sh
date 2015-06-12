# Dump @ 42
## After a reset home

#echo "[ ]  Updating Homebrew --- \n"

#cd ~/Library/Caches ; rm -rf Homebrew
#brew update && brew upgrade;
#mkdir ~/Library/Caches/Homebrew/

#echo "[\033[38;5;190mx\033[0m]  Updating Homebrew --- \n"
cd ~ ;

echo "[ ]  Installing Nerdtree to your vim (emacs is for the weaks) --- \n"

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
cd ~/.vim/bundle ; git clone https://github.com/scrooloose/nerdtree.git ;

echo "[\033[38;5;190mx\033[0m]  Nerdtree installed --- \n"

# Copying conf files && colors

echo "[ ]  Saving your -rc files and making your vim and shell pretty --- \n\t\033[38;5;240mShell is optional\033[0m"
cd ~ && git clone https://github.com/CCorazza/config.git .configbak;
mv ~/.myvimrc ~/.configbak/myvimrc.bak && mv ~/.zshrc ~/.configbak/zshrc.bak && \ 
#cp -i .configbak/iTermProfile/com.googlecode.iterm2.plist ~/Library/Preferences
cp .configbak/conf/vimrc ~/.myvimrc && \
cp .configbak/conf/zshrc ~/.zshrc && \
cp -r .configbak/colors ~/.vim/colors;
#rm -rf .config/ ;

echo "[\033[38;5;190mx\033[0m]  Prettied everything :3 --- \n\t\033[38;5;240mYour original files are backed up under ~/.myvimrc.bak and ~/.zshrc.bak\033[0m"
