class Song < ActiveRecord::Base
   has_many :song_genres
   has_many :genres, through: :song_genres
   belongs_to :artist

   def slug
      #Blank Space
      self.name.downcase.split(' ').join('-')
   end

   def self.find_by_slug(filename)
      #filename = 'blank-space'
      self.find {|song| song.slug == filename}
   end
end
