class Artist < Sinatra::Base
  has_many :songs
  has_many :genres
end
