class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  # def name=(s)
  #   write_attribute(:name, s.to_s.titleize)
  # end
end
