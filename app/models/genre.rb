class Genre < ActiveRecord::Base
  include Concerns::Slugifiable
  extend Concerns::Findable
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
