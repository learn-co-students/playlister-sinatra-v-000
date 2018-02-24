class Song < ActiveRecored::Base
  belongs_to :artist
  has_many :genres through: :song_genres
end
