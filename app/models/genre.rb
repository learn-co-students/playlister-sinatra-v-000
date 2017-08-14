class Genre < ActiveRecord::Base

  has_many :artist
  has_many :songs

end