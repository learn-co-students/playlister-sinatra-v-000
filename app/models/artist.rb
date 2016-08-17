class Artist < ActiveRecord::Base
  include Slug
  extend ClassSlug
  has_many :songs
  has_many :genres, through: :songs
end
