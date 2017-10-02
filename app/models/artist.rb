class Artist < ActiveRecord::Base
  include Slugify
  extend ClassSlugify

  has_many :songs
  has_many :genres, through: :songs

end
