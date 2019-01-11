class Genre < ActiveRecord::Base 
  has_many :artists, :through => :songs
  has_many :songs, :through => :song_genres
  has_many :song_genres
  
  def slug 
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
  
  def self.find_by_slug(slug)
    @genres = Genre.all 
    @genres.detect{|genre| genre.slug == slug}
  end
end