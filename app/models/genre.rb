class Genre < ActiveRecord::Base
extend Concerns::Slugify_class
include Concerns::Slugify_instance


  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

end

