#!/usr/bin/env ruby

require "yaml"
require "fileutils"

# ensure we log all output and errors to our logfile
log_dir = File.join(File.dirname(__FILE__), 'log')
$stdout.reopen(File.join(log_dir, "dj-downloader.log"), "w")
$stdout.sync = true
$stderr.reopen($stdout)

# read config.yml from current directory
config = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))

if config['output_dir'].nil?
  puts "Please specify output_dir in config.yml"
  exit
end

# create output directory if it doesn't exist
unless File.directory?(config['output_dir'])
  FileUtils.mkdir_p(config['output_dir'])
end

# get path to downloader from config
if config['dj_downloader_path'].nil?
  puts "Please specify dj_downloader_path in config.yml"
  exit
end

# get list of URLs to download from command-line arguments
files_to_download = ARGV

# download each file
files_to_download.each_with_index do |file, index|
  puts "Downloading #{file} (#{index + 1}/#{files_to_download.length})"
  `#{config['dj_downloader_path']} --paths #{config['output_dir']} --restrict-filenames --no-mtime --newline -x --audio-format mp3 #{file} `
end

