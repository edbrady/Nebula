require "shellwords"
require "find"
require "fileutils"

namespace :library do
  desc "Builds Series table from main library"
  task series: :environment do
    videoPath = ENV["VIDEO_DIR"]
    seriesPath = ENV["SERIES_SUBDIR"]
    
    Libraray.for_each do |video|    
      if video.fullpath.includes?(seriesPath)
        # Establishes the section of the filepath where each series is
        seriesDirDepth = seriesPath.count('/') + 1 
        series = line.split('/')[seriesDirDepth] #grab series directory name
        Episode.create(:fullpath => fullPath, 
                       :series => series, 
                       :episode => file)
      end
    end
  end
end
