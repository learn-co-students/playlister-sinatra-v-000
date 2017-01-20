class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :genres, through: :song_genre #looks through table for song_id

end
