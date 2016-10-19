class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  # def name=(s)
  #   write_attribute(:name, s.to_s.titleize)
  # end
end
