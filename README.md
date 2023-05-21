## DJ Downloader

Allows dragging and dropping a YouTube URL to a Desktop icon and automates downloading an mp3 file of the youtube video's audio to a DJ directory.

# Dependencies

 - [Homebrew](https://brew.sh/)
 - [yt-dlp](https://github.com/yt-dlp/yt-dlp) (will attempt to install via homebrew if not found)

## Installation

From a `Terminal.app` command-line run:

```
git clone https://github.com/rick/dj-downloader
cd dj-downloader
script/setup
```

If this is successful this will have installed a `dj-downloader` icon to the current user's Desktop. Drag YouTube URLs here.


## TODO

 - we need a way to configure the destination path for DJ files, probably at setup time; probably stored in some sort of config file
 - deezer integrations via Deemix?


