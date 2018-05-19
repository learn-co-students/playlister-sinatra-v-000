class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through :songs
  has_many :genres, through :song_genres
end


# rspec spec/models/01_artist_spec.rb
