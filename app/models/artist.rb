class Artist < ActiveRecord::Base
  include Slugifiable
  extend SlugifiableFind
  
  has_many :songs
  has_many :genres, through: :songs

end
