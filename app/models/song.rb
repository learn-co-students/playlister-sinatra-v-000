class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    
    extend Sluggable::ClassMethods #self.find_by_slug
    include Sluggable::InstanceMethods #slug

end