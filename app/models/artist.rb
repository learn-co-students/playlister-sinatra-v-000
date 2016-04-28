class Artist < ActiveRecord::Base
extend Slugify
include SlugName
  has_many :songs
  has_many :genres, through: :songs

end
