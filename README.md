# youtube-dnd
Bash function for [youtube-dl](https://github.com/ytdl-org/youtube-dl) with drag and drop capability.

## Usage
Type `yt` in terminal and press `Enter` key then drag and drop url from your web browser into terminal to download the video using [youtube-dl](https://github.com/ytdl-org/youtube-dl). There is not need to type command and press `Enter` with each new link.

You can paste next url as soon as last download is finish (you will see `[download] 100%` and empty new line in terminal). It is possible to paste new url while last one is still in progress, but if you add more than one, download will fail (all urls will be treated as one).

To terminate process press `Ctrl+C` or simply close the terminal. 

## Installation
Install [youtube-dl](https://github.com/ytdl-org/youtube-dl) and make sure it is working properly (e.g. try executing `youtube-dl --version`).

To add function for your user (Linux, macOS, etc.):
To install it right away for all UNIX users (Linux, macOS, etc.), type:

```bash
sudo curl -L https://raw.githubusercontent.com/lukdz/youtube-dnd/master/yt -o /usr/local/bin/yt
sudo chmod a+rx /usr/local/bin/yt
```

Alternatively you can add content of `bash_function` file from this repository to your `~/.bash_aliases` on Ubuntu or `~/.bash_profile` on macOS.

## Issues
- ~~adding third link while first one is downloading, causes second and third to merge together~~ fixed by running youtube-dl in the background
- ~~read function is broken on `zsh`~~ read function on zsh uses `-k` option instead of `-n`
