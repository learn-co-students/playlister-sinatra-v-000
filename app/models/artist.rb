class Artist < ActiveRecord::Base
   has_many :songs
   has_many :genres, through: :songs

   def slug
      #Blank Space
      self.name.downcase.split(' ').join('-')
   end

   def self.find_by_slug(slugname)
      #slugname = 'blank-space'
      self.find {|artist| artist.slug == slugname}
   end
end
