class Genre< ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
 has_many :artists, :through => :songs

 def slug
   slug=self.name.downcase.gsub(" ", "-")
 end

 def self.find_by_slug(slug)
   name=slug.split("-").map {|word| word.capitalize}.join(" ")
   find_by_name(name)
 end
end
