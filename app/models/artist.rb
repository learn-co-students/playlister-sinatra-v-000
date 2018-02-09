class Artist < ActiveRecord::Base
  include Slugify::Instances
  extend Slugify::Classes

  has_many :songs
  has_many :genres, through: :songs
end
