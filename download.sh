#!/bin/bash
RED='\033[0;31m                               ' # Red tab
NC='\033[0m' # No Color
quality='high' # Quality to use
echo 
echo 
echo 
# Title of the tv show "Directory name, File name"
printf "${RED}Title (No Space, use dot), followed by [ENTER]:${NC}"
echo
read title
# Season of the tv show "Directory name, File name"
printf "${RED}Season (S01 format), followed by [ENTER]:${NC}"
echo
read saison
# Resolution of the video "Informative"
printf "${RED}Resolution of the stream (480p,720p..), followed by [ENTER]:${NC}"
echo
read resolution
# The first episode in the list
printf "${RED}The first episode number (1,10...), followed by [ENTER]:${NC}"
echo
read episode
episode=$(( episode-1 ))
# Signature
printf "${RED}Please enter your signature, followed by [ENTER]:${NC}"
echo
read signature
# Directory
printf "${RED}Please enter the output directory (a folder will be created inside), followed by [ENTER]:${NC}"
echo
read initial
dir=$(printf $initial/$title.$saison.FRENCH.$resolution.WEB-DL.H264-$signature/)
#----------------------------------------------------------------------
#----------------------------DO-NOT-EDIT-------------------------------
#----------------------------------------------------------------------
FILE=$1
while read -r line || [[ -n "$line" ]]; do
	episode=$(( episode+1 ))
	printf "${RED}Downloading $title $saison Episode $episode ${NC}\n"
	eval $line --outdir "$dir" --outfile "$title.${saison}E0$episode.FRENCH.$resolution.WEB-DL.H264-$signature.flv" --quality $quality
done < $FILE
######################
# Created by Dommage #
######################