class Artist < ActiveRecord::Base
  include Slugifiable

  #has multiple songs
  #has multiple genres
  has_many :songs
  has_many :genres

end
