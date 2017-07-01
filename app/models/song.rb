class Song < ActiveRecord::Base
  include Slugifable

  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres
end
