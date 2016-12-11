class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  include Displayable

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end
