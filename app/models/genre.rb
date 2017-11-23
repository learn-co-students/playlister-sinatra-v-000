class Genre <ActiveRecord::Base
include Slugifiable
extend SlugifiableFind
 has_many :song_genres
 has_many :songs, through: :song_genres
 has_many :artists, through: :songs
end
