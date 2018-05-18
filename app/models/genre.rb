class Genre < ActiveRecord::Base
  has_many :artists
  has_many :song_genres
  has_many :songs, through: :song_genres
end

# rspec spec/models/03_genre_spec.rb
