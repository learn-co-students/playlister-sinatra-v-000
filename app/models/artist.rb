class Artist < ActiveRecord::Base
  has_many :genres, through: :songs
  has_many :songs
end
