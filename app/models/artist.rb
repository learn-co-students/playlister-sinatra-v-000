class Artist < ActiveRecord::Base
  
  has_many :songs
  has_many :genres, through: :songs

  include Concerns::Sluggable
  extend Concerns::Findable
  
end  