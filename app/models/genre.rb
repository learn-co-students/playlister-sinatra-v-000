class Genre < ActiveRecord::Base
   has_many :song_genres
   has_many :songs, through: :song_genres
   has_many :artists, through: :songs

   def slug
      #Blank Space
      self.name.downcase.split(' ').join('-')
   end

   def self.find_by_slug(filename)
      #filename = 'blank-space'
      self.find {|genre| genre.slug == filename}
   end
end
