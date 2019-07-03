#!/usr/bin/bash
pause(){
	mytitle="Press Enter to Continue…"
	echo -e '\033k'$mytitle'\033\\'
	read enterer
	clear
}
mytitle="Yuzu Keys Installer"
echo -e '\033k'$mytitle'\033\\'
clear
menu=""
echo -n "Checking for updates..."
up=$(curl https://raw.githubusercontent.com/aaronliu0130/trashBin/master/version)
if [[$up!="v0.2.0-alpha"]]; then
 	clear
	echo "An update was found. Now updating. Will restart after update."
	curl -o update.sh https://raw.githubusercontent.com/aaronliu0130/trashBin/master/update.sh
	bash update.sh
	exit
fi
menu=""
while [[$menu!="n"]]&&[[$menu!="y"]]&&[[$menu!="quit"]]
	echo -n "Do you want to install Yuzu? (y/n/quit):  "
	read menu
done
clear

if [[$menu=="y"]];then
	clear
	menu=""
	while [[$menu!="c"]]&&[[$menu!="n"]] do
		echo -n "Do you want to install Yuzu Canary or Nightly?Please use lowercase letters: "
		read -n 1 menu
	done
	echo
	echo "This will download Yuzu. Allow it to download."
	echo
	if [[$menu=="c"]] then
		curl -o canary.tar.gz -L https://www.mediafire.com/file/58s9ii2uaihecg4/canary.tar.gz/file
	elif [[$menu=="n"]] then
		curl -o nightly.tar.gz -L https://www.mediafire.com/file/1q74iwictd3zl56/nightly.tar.bz2/file
	fi
	echo "We will now install Yuzu, then delete the leftovers."
	if [[$menu=="c"]] then
		tar -zxvf canary.tar.gz
		mv canary /Applications
		rm canary.tar.gz
	elif [[$menu=="n"]] then
		tar -zxvf nightly.tar.gz
		mv nightly /Applications
		rm nightly.tar.gz
	echo -n "Done."
	pause()
fi

if [[$menu!="quit"]] then
	clear
	menu=""
	while [[$menu!="y"]]&&[[$menu!="n"]] do
		echo -n "Do you want to download the keys?(y/n): "
		read -n 1 menu
	done
	if [[$menu=="y"]] then
		echo
		cd ~/.local/share/yuzu
		mkdir keys
		cd keys
		echo "Writing keys to ~/.local/share/yuzu..."
 		curl -o prod.keys -L https://s.hipeopeodev.us/prod.keys
		curl -o title.keys -L https://s.hipeopeodev.us/title.keys
		curl -o shared_font.bin -L https://s.hipeopeodev.us/shared_font.bin
		echo "Done."
		pause()
	fi
	menu=""
	while [[$menu!="y"]]&&[[$menu!="n]] do
		echo -n "Do you want to install the System Archives?(y/n): "
		read -n 1 menu
	done
	if [[$menu=="y"]] then
		echo "We will now download the System Archives. This may take a while, let it download."
		cd ~/.local/share/yuzu/nand/system
		curl -o System_Archives.zip -L https://www.dropbox.com/s/0gwmpgus9t4q1dm/System_Archives.zip?dl=1
		echo "Unzipping System Archives…"
		unzip System_Archives.zip
		echo "Writing System Archives to ~/.local/share/yuzu/nand/system"
		del System_Archives.zip
		echo -n "Done."
		pause()
	fi
fi
:C
clear
echo "Thanks to /u/yuzu_pirate, /u/Azurime, and /u/bbb651 for their contributions to /r/YuzuP I R A C Y."
echo
echo "This program was originally made by /u/Hipeopeo, and ported to MacOS by /u/AaTube."
echo
echo "Thanks to the yuzu devs for making Yuzu!"
pause()
exit
