class Song < ActiveRecord::Base
include Slugifiable
 belongs_to :artist
 has_many :song_genres
 has_many :genres, through: :song_genres

 def self.find_by_slug(name)
   self.all.detect do |i|
     i.slug == name
   end
 end
end
