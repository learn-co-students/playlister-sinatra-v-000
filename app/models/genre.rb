class Genre < ActiveRecord::Base

  include Slugifiable
  extend FindBySlug

  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs
end