#/bin/bash
# dfm dot files manager

dest="$HOME/"
dir="$(pwd)/"
files="$(find . -maxdepth 1 \! -type l | tail -n +2 | grep -Ewv "$(cat ignore-list)")"

function list
{
	echo "Files: "
	for file in $files; do
		printf "	"
		if [ -f $file ]; then
			printf "📜"
		fi
		if [ -d $file ]; then
			printf "📂"
		fi
		printf " $file\n"
		#ln -s $dir$file $dest$file 
	done
	exit
}

function install
{
	
	echo "Soft linking: "
	for file in $files; do
		if [ ! -f *dest$file ] && [ -e $dest$file ]; then
			cp -R $dest$file $dest$file.post_dfm
			rm -fr $dest$file
			#todo message to show mv  file and if the mv failed
		fi
		echo "linking $file"
		ln -s $dir$file $dest$file 
	done
	exit
}

function uninstall
{
	echo "uninstalling..."
	for file in $files; do
		if [ -L $dest$file ]; then
			rm $dest$file
			#todo message to show remove file and if the remove failed
		fi
		if [ -e $dest$file.post_dfm ]; then
			cp -R $dest$file.post_dfm $dest$file
			rm -fr $dest$file.post_dfm
			#todo message to show mv  file and if the mv failed
		fi
	done
	exit
}

command="$1"
${command}
