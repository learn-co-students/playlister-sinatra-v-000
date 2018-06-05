class Song < ActiveRecord::Base
  include Slugifiable

  #has ONE artist
  #has multiple genres
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end
