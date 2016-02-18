class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song
  include Sluggable::InstanceMethods
  extend Sluggable::ClassMethods  
end 