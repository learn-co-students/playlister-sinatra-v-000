class Artist < ActiveRecord::Base
  include Slugifiable
  extend Findable
  
  has_many :songs
  has_many :genres, through: :songs
end
