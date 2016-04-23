class Song < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable
  belongs_to :artist
  has_one :song_artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end