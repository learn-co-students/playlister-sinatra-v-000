class Artist < ActiveRecord::Base
  include SlugInstance
  extend SlugClass
  
  has_many :songs
  has_many :genres, through: :songs
  
end