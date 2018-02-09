class SongGenre < ActiveRecord::Base
  include Slugify::Instances
  extend Slugify::Classes
  
  belongs_to :song
  belongs_to :genre
end
