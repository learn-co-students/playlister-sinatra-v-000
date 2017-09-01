class Song < ActiveRecord::Base
  extend Concerns::Slugify
  include Concerns::Slugify

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
