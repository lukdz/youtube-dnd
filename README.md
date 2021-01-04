# youtube-dnd
Bash function for [youtube-dl](https://github.com/ytdl-org/youtube-dl) with drag and drop capability.

## Usage
Type `yt` in terminal and press `Enter` key then drag and drop url from your web browser into terminal to download the video using [youtube-dl](https://github.com/ytdl-org/youtube-dl). There is not need to type command and press `Enter` with each new link.

You can paste next url as soon as last download is finish (you will see `[download] 100%` and empty new line in terminal). It is possible to paste new url while last one is still in progress, but if you add more than one, download will fail (all urls will be treated as one).

To terminate process press `Ctrl+C` or simply close the terminal. 

## Installation
Install [youtube-dl](https://github.com/ytdl-org/youtube-dl) and make sure it is working properly (e.g. try executing `youtube-dl --version`).

To add function for your user (Linux, macOS, etc.):

Open file:
- `~/.bash_profile` on macOS
- `~/.bash_aliases` on Ubuntu

To open the file file type in terminal:
- on mac OS `open -a TextEdit ~/.bash_profile`
- on Ubuntu `gedit ~/.bash_profile`
and press `Enter` key

Copy and paste following code and save changes to file.
```bash
function yt {
	while true
	do
		local url=""
		local char=""
		while read -t 1 -n 1 -s -r char || [ -z "${url}" ]
		do
			url+="${char}"
		done
		echo "[input] ${url}"
    	youtube-dl "${url}"
    	echo
	done
}
```

Remember to open new terminal for changes to take an effect. 

## Issues
- adding third link while first one is downloading, causes second and third to merge together
- function seams to be broken on `zsh`
