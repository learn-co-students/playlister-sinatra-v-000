class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    extend Concerns::ClassMethods
    include Concerns::InstanceMethods
    
end