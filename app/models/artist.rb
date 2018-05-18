class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres
end


# rspec spec/models/01_artist_spec.rb
