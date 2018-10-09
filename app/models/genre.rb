class Genre < ActiveRecord::Base
  has_many :artists
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  
  def slug 
    name.downcase.gsub(/\W/,"-")
  end
  
  def self.find_by_slug(slug)
    Genre.all.find {|genre| genre.slug == slug}
  end #module this ... seriously
end