class Genre < ActiveRecord::Base
  has_many :songs_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  include Slugifiable::SlugMethod
  extend Slugifiable::FindBySlug

end
