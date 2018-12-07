class Artist < ActiveRecord::Base
  include Slug
  has_many :songs
  has_many :genres, :through => :songs


end