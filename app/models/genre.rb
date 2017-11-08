class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split(' ').join('-')
  end

   def self.find_by_slug(slug)
     nocaps = ['the','with','and', 'a']
     genre_name = slug.split('-').map{|word| nocaps.include?(word) ? word : word.capitalize}.join(' ')
     self.find_by_name(genre_name)
   end

end
