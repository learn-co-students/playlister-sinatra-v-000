class Artist < ActiveRecord::Base

  #has multiple songs
  #has multiple genres
  has_many :songs
  has_many :genres

end
