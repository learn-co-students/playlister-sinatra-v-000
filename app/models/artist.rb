class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres

def initialize(artist)
#  binding.pry
  @artist = Artist.create(name: parmas[:name])
end


end
