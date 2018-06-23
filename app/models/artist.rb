class Artist < ActiveRecord::Base
  has_many :genres, through: :songs
  has_many :songs

  include Slugifiable

	

end