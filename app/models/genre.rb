class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  include Displayable

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
