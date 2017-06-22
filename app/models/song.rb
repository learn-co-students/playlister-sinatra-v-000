class Song < ActiveRecord::Base
extend Concerns::Slugify_class
include Concerns::Slugify_instance


      has_many :song_genres
      has_many :genres, through: :song_genres
      belongs_to :artist
      
end

