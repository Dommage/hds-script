#!/bin/bash
RED='\033[0;31m                               ' # Red tab
NC='\033[0m' # No Color
quality='high' # Quality to use
# Title of the tv show "Directory name, File name"
printf "\n\n\n${RED}Title (No Space, use dot), followed by [ENTER]:${NC}"
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
# Language
printf "${RED}Language (All in CAP, ex FRENCH), followed by [ENTER]:${NC}"
echo
read lang
# Title of the tv show "Directory name, File name"
printf "${RED}Codec used (H264,x265...), followed by [ENTER]:${NC}"
echo
read codec
#######################################################################
#############################DO-NOT-EDIT###############################
#######################################################################
FILE=$1
while read -r line || [[ -n "$line" ]]; do
	episode=$(( episode+1 ))
	printf "${RED}Downloading $title $saison Episode $episode ${NC}\n"
	if (( episode < 10 ));
		then
	eval $line --outdir "$dir" --outfile "$title.${saison}E0$episode.$lang.$resolution.WEB-DL.$codec-$signature.flv" --quality $quality
		else
	eval $line --outdir "$dir" --outfile "$title.${saison}E$episode.$lang.$resolution.WEB-DL.$codec-$signature.flv" --quality $quality
fi
done < $FILE
######################
# Created by Dommage #
######################
