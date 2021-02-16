class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    extend Sluggable::ClassMethods #self.find_by_slug
    include Sluggable::InstanceMethods #slug

end