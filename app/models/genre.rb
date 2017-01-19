class Genre < ActiveRecord::Base

  has_many :artists
  has_many :songs #or has_many :songs, through: :genre 


end
