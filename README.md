# youtube-dnd
Bash function for [yt-dlp](https://github.com/yt-dlp/yt-dlp) with drag and drop capability.

## Usage
Type `yt` in terminal and press `Enter` key then drag and drop url from your web browser into terminal to download the video.
There is not need to type command and press `Enter` with each new link.

You can paste next url as soon as last download is finish (you will see `[download] 100%` and empty new line in terminal). 
It is possible to paste new url while last one is still in progress, but if you add more than one, download will fail (all urls will be treated as one).

To terminate process press `Ctrl+C` or simply close the terminal. 

## Installation
Install [yt-dlp](https://github.com/ytdl-org/youtube-dl) and make sure it is working properly (e.g. try executing `yt-dlp --version`).

To add function for your user (Linux, macOS, etc.):
To install it right away for all UNIX users (Linux, macOS, etc.), type:

```bash
sudo curl -L https://raw.githubusercontent.com/lukdz/youtube-dnd/master/yt -o /usr/local/bin/yt
sudo chmod a+rx /usr/local/bin/yt
```

Alternatively you can add content of `bash_function` file from this repository to `~/.bash_aliases` on Ubuntu or `~/.bash_profile` on macOS.

## Options
Default program used to process urls in `yt-dlp`. 
This can be changed by setting environmental variable with name of selected program e.g.:
```
export YT_DOWNLOADER="yt-dlp"
export YT_DOWNLOADER="youtube-dl"
# for macOS to avoid issues with python version
export YT_DOWNLOADER="/usr/bin/python3 /usr/local/bin/youtube-dl"
```

It possible to modify the link before passing them to command line tool for example 
to use with [wkhtmltopdf](https://wkhtmltopdf.org/) to render HTML into PDF:
```
wkslug () {
    wkhtmltopdf \
        "$1" \
        "$(echo "$1" | iconv -c -t ascii//TRANSLIT | sed -E 's/[~^]+//g' | sed -E 's/[^a-zA-Z0-9]+/-/g' | sed -E 's/^-+|-+$//g' | tr A-Z a-z).pdf"
}
export -f wkslug
export YT_DOWNLOADER="wkslug"
export YT_START_OPTION=${YT_START_OPTION:---version}
```

To make this change persistent above example to to `~/.bash_aliases` on Ubuntu or `~/.bash_profile` on macOS.

## Issues
- ~~adding third link while first one is downloading, causes second and third to merge together~~ 
fixed by running downloader in the background
- ~~read function is broken on `zsh`~~ read function on zsh uses `-k` option instead of `-n`

## External links
- [Create URL friendly slug with pure bash?](https://stackoverflow.com/questions/47050589/create-url-friendly-slug-with-pure-bash)
