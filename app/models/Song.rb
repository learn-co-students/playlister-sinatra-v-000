class Song < ActiveRecord::Base
  include Slug_Mod
  extend Find_By_Slug_Mod
   has_many :song_genres
   has_many :genres, through: :song_genres
   belongs_to :artist
end
