class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.gsub(" ", "-").downcase
  end
  
  def self.find_by_slug(slug)
    Genre.all.find{|song| song.slug == slug}
  end
end