class Artist < ActiveRecord::Base
  include Slugify
  extend Slugify
  
  has_many :songs
  has_many :genres, through: :songs
end
