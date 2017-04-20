class Genre < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods

  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

end
