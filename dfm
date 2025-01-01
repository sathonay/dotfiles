#/bin/bash
# dfm dot files manager

dest="$HOME/"
dir="$(realpath .)/$(dirname $0)/"
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
	git -C $dir submodule update --init	
	for file in $files; do
		echo $file
		if [ ! -L $dest$file ] && [ -f $dest$file ]; then
			cp -R $dest$file $dest$file.prior_dfm
			rm -fr $dest$file
			echo "	found $file in install destination, a $file.prior_dfm"
			#todo message to show mv  file and if the mv failed
		fi
		if [ ! -e $dest$file ]; then
			echo "	linking $dest$file -> $dir$file"
			ln -s $dir$file $dest$file 
		fi
	done
	exit
}

uninstall()
{
	echo "uninstalling..."
	git -C $dir submodule deinit --all	
	for file in $files; do
		echo $file
		if [ -L $dest$file ]; then
			rm $dest$file
			echo "	removed link for $file"
			#todo message to show remove file and if the remove failed
		fi
		if [ -e $dest$file.prior_dfm ]; then
			cp -R $dest$file.prior_dfm $dest$file
			rm -fr $dest$file.prior_dfm
			echo "	found $file.prior_dfm and rollbacked to it"
			#todo message to show mv  file and if the mv failed
		fi
	done
	exit
}

command="$1"
${command}
echo "$functions" 

