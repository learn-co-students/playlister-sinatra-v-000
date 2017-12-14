class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  
  def slug
    name.downcase.gsub(/[\s.'&+]/, '-')
  end
  
  def self.find_by_slug(slug)
    self.all.select {|genre| genre.slug == slug}.last
  end
  
end