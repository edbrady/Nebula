class Library < ActiveRecord::Base

  validates_uniqueness_of :fullpath

end
