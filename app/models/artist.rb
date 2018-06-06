class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  attr_reader :artist_id
end
