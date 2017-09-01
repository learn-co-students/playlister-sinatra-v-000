class Artist < ActiveRecord::Base
  extend Concerns::Slugify
  include Concerns::Slugify

  has_many :songs
  has_many :genres, through: :songs
end
