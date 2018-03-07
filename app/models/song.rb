class Song < ActiveRecord::Base
  #has_one :artist_id
  belongs_to :artists
  has_many :genres, through: :song_genres
end
