require "shellwords"
require "find"
require "fileutils"

namespace :library do
  desc "Imports library from video directory"
  task import: :environment do
    videoPath = ENV["VIDEO_DIR"]
    Find.find(videoPath) do |line|
      escFile = "%s" % Shellwords.escape(line)
      contentType = `file --mime-type #{escFile} |cut -d ':' -f2`
      if contentType.include?("video")
        puts "Collecting metadata for: #{line}"
        file = File.basename(line)
        fullPath = File.absolute_path(line)
        entry = Library.create(:fullpath => fullPath,
                       :escfile => escFile,
                       :video => file,
                       :contenttype => contentType)
      end
    end
  end
end
