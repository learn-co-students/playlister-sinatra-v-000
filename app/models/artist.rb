class Artist < ActiveRecord::Base
  include Slugifiable::Instance
  extend Slugifiable::Class

  has_many :songs
  has_many :genres, through: :songs
  
end