class LibrarianController < ApplicationController

  before_filter :authorize

  def list
    @libraries = Library.all
  end

  def random
    @video = Library.offset(rand(Library.count)).first
    redirect_to action: "watch", video: @video.fullpath, contenttype: @video.contenttype, title: @video.video
  end

  def watch
  end

end
