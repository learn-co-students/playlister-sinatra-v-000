class Artist < ActiveRecord::Base
  include Slug
  extend SlugFind

  has_many :songs
  has_many :genres, through: :songs
end