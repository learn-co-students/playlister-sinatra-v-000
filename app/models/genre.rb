class Genre < ActiveRecord::Base
    include Slugable::InstanceMethods  # change aritst from b1 to b-1
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
end
