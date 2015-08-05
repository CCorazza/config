# Installing JS runtime & Utilitaries :
echo "\033[33mINSTALL UTILITARIES STARTING\n\n\nNOW\n\033[0m"
sudo apt-get install ruby ruby-dev nodejs libxml2 libxml2-dev ruby-libxml libruby1.9.1 ri1.9.1 libmagickwand-dev libxslt1-dev apache2 apache2-threaded-dev build-essential git-core libsasl2-dev

# Installing PostGreSQL & dependencies :
echo "\033[35mINSTALL COMPLETE \n\033[33mINSTALL POSTGRESQL STARTING\n\n\nNOW\n\033[0m"
sudo apt-get install postgresql postgresql-9.4-postgis-2.1 openjdk-7-jre-headless osmosis libjodatime-java postgresql-contrib postgresql-contrib-9.4 postgresql-9.4-debversion postgresql-client libpq-dev postgresql-server-dev-all pgadmin3 

# Installing ImageMagick : 
echo "\033[35mINSTALL COMPLETE \n\033[33mINSTALL IMAGEMAGICK STARTING\n\n\nNOW\n\033[0m"

sudo apt-get install imagemagick imagemagick-doc autotrace enscript ffmpeg gimp gnuplot grads graphviz hp2xx html2ps libwmf-bin mplayer povray radiance texlive-base-bin transfig ufraw-batch libfftw3-bin libfftw3-dev inkscape

# Installing gems : 
echo "\033[35mINSTALL COMPLETE \n\033[33mINSTALL GEM STARTING\n\n\nNOW\n\033[0m"
sudo gem install bundler bundle nokogiri nokogumbo

# Cleaning the system :

echo "\033[35mAPT-GET INSTALL COMPLETE \n\033[33mCLEANING SYSTEM STARTING\n\n\nNOW\n\033[0m"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove

# Compile Assets

cd ~ ; mkdir Algolia
cd ~/Algolia
echo "\033[35mAPT-GET INSTALL COMPLETE \n\033[33mCLONING REPOSITORY STARTING\n\n\nNOW\n\033[0m"
git clone --depth=1 https://github.com/openstreetmap/openstreetmap-website.git
cd openstreetmap-website
echo "\033[32mYou are in" `pwd`
echo "\033[35mCLONING COMPLETE \n\033[33mCOPYING YML FILE STARTING\n\n\nNOW\n\033[0m"
cp -v config/example.application.yml config/application.yml
cp -v config/example.database.yml config/database.yml

cd db/functions
echo "\033[32m You are in \033[0m" `pwd` 
echo "\033[35mCOPYING COMPLETE \n\033[33mCOMPILATING FUNCTIONS STARTING\n\n\nNOW\n\033[0m"
make libpgosm.so

cd ../..
echo "\033[32m You are in \033[0m" `pwd` 
bundle install
