#!/usr/bin/env ruby

require "yaml"
require "fileutils"

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

puts "Starting DJ Downloader...\n\n"
puts "Paste the URLs of the files you want to download, one per line, be sure to hit <Enter>."

# read URLs from stdin
files_to_download = []
while line = gets
  file = line.chomp
  next if file =~ /^\s*$/

  puts "Downloading #{file} ..."
  system("#{config['dj_downloader_path']} --paths #{config['output_dir']} --restrict-filenames --no-mtime --newline -x --audio-format mp3 #{file}")
end
