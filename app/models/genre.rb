class Genre <ActiveRecord::Base
  has_many :artists, through: :songs_genres
  has_many :songs, through: :songs_genres
end
