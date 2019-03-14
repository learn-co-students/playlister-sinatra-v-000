class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

binding.pry
end
