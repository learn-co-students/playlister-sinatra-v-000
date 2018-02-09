class Song < ActiveRecord::Base
  include Slugify::Instances
  extend Slugify::Classes

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
