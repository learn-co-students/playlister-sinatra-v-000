class Genre < ActiveRecord::Base
  has_many :song_genres
end