class Artist < ActiveRecord::Base
  include Slugifiable

  has_many :genres, through: :songs

  has_many :songs


end