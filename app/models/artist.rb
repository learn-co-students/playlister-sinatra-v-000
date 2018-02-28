class Artist < ActiveRecord::Base
  include Slugifiable::Slugify
  extend Slugifiable::FindableBySlug

  has_many :songs
  has_many :genres, through: :songs
end
