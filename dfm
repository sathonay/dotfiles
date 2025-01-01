#/bin/bash
# dfm dot files manager

dest="$HOME/"
dir="$(dirname $0)/"
self=$(basename "$0")
ignore="dfm_ignore"
files="$(ls -A $dir | grep -Ewv "$(cat $dir$ignore | tr '\n' '|')$ignore|$self")"
functions="$(cat $0 | grep -E "\(\)$" | sed "s/()//g")"

list()
{
	echo "Files: "
	for file in $files; do
		printf "	"
		if [ -f $dir$file ]; then
			printf "📜"
		fi
		if [ -d $dir$file ]; then
			printf "📂"
		fi
		printf " $file\n"
		#ln -s $dir$file $dest$file 
	done
	exit
}

install()
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

uninstall()
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
echo "$functions" 

