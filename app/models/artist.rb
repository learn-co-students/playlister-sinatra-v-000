class Artist < ActiveRecord::Base

  include Slugifiable

  # An Artist can have multiple songs and multiple genres
  has_many :songs
  has_many :genres, :through => :songs



end
