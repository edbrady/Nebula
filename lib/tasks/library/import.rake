require "shellwords"
require "find"
require "fileutils"

namespace :library do
  desc "Imports library from video directory"
  task import: :environment do
    videoPath = ENV["VIDEO_DIR"]
    Find.find(videoPath) do |line|
      escFile = "%s" % Shellwords.escape(line)
      contentType = `file --mime-type #{escFile} |cut -d ':' -f2`.strip
      if contentType.include?("video")
        file = File.basename(line)
        fullPath = line.slice!(ENV["VIDEO_DIR"] + '/')
        puts "Collecting metadata for: #{line}"
        entry = Library.create(:fullpath => line,
                       :escfile => escFile,
                       :video => file,
                       :contenttype => contentType)
      end
    end
  end
end
