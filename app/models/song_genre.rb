class SongGenre < Sinatra::Base
  has_many :Songs
  has_many :Genres
end
