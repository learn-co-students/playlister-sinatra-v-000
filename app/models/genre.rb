
class Genre < ActiveRecord::Base
 
   has_many :artists, through: :songs
   has_many :songs, through: :song_genres
   has_many :song_genres

   def slug
   	self.name.gsub(" ", "-").downcase
   end

   def self.find_by_slug(slug_name)
   	self.all.find{|instance| instance.slug==slug_name}
   end

end