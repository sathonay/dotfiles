#/bin/bash
echo "Soft linking: "
#files="$(ls -A | grep -Ewv "$(cat ignore-list)")"


dest="$HOME/"
files="$(find . -maxdepth 1 \! -type l | tail -n +2 | grep -Ewv "$(cat ignore-list)")"



for file in $files; do
	echo "linking $file"
	ln -s $file $dest$file-soft 
done
