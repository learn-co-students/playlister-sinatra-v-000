class Genre < ActiveRecord::Base
  include Slug_Mod
  extend Find_By_Slug_Mod
  has_many :song_genres
  has_many :songs, through: :song_genres

#  has_many :songs
  has_many :artists, through: :songs



end
