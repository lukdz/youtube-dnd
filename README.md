# youtube-dnd
Bash alias for [youtube-dl](https://github.com/ytdl-org/youtube-dl) with drag and drop capability for unix

# use
Type `y` into terminal and press `Enter` key then drag and drop url from your web browser into terminal to download the video using [youtube-dl](https://github.com/ytdl-org/youtube-dl). 

You can paste next url as soon as last download is finish (you will see `[download] 100%` and empty new line in terminal). It is possible to paste new url while last one is still in progress, but if you add more than one, download will fail (all urls will be treated as one).

To terminate process press `Ctrl+C` or simply close the terminal. 

# installation
Install [youtube-dl](https://github.com/ytdl-org/youtube-dl) and make sure it is working properly.

To add drag and drop capability for your user (Linux, macOS, etc.), copy function:

```bash
function y {
	while true
	do
		url=""
		char=""
		while read -t 1 -n 1 -s char || [ -z "$url" ]
		do
			url="$url$char"
		done
		echo "[input]" $url
    	youtube-dl $url
    	echo
	done
}
```

open file:
- ~/.bash_profile on macOS
- ~/.bash_aliases on Ubuntu

To open the file file typy in terminal:
- on mac OS `open -a TextEdit ~/.bash_profile`
- on Ubuntu `gedit ~/.bash_profile`

and press `Enter` key

then paste copied function into file, save it and close the terminal (for changes to take an effect). 
