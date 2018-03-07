class Artist < ActiveRecord::Base
  include Concerns::Slugify
  extend Concerns::Findable
  has_many :songs
  has_many :genres, through: :songs

end
