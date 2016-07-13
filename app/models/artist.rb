class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable::Slug 
  extend Slugifiable::FindBySlug

end