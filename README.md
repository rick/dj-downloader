## DJ Downloader

Allows pasting youtube URLs into a Terminal running this tool, which then downloads the mp3 audio for the URL in question and stores it in the config-specified directory.

# Dependencies

 - [Homebrew](https://brew.sh/)
 - [yt-dlp](https://github.com/yt-dlp/yt-dlp) (will attempt to install via homebrew if not found)
 - [ffmpeg](https://ffmpeg.org/) (will attempt to install via homebrew if not found)

## Installation

From a `Terminal.app` command-line run:

```
git clone https://github.com/rick/dj-downloader
cd dj-downloader
script/bootstrap
script/setup
```

Then edit the `config.yml` file to set the path for the folder where mp3 files should be output, and the path to `yt-dlp` (e.g., the output of `which yt-dlp`)

## Running

From the same checkout path just:

```
./run
```
