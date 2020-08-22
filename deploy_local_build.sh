#!/bin/bash

# got to directory
cd /home/peter/homepage

# build page
echo -e "$(tput setaf 2)\n. building\n$(tput setaf 7)"
jekyll build

# copy new page content into page directory
echo -e "$(tput setaf 2)\n. copying\n$(tput setaf 7)"
sudo rsync -r -u _site/* /var/www/html/petermeissner.de_root -r
