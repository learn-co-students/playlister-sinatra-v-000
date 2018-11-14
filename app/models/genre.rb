class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres
  
  def self.find_by_slug(slug)
    self.all.detect { |e| e.slug == slug }
  end

  def slug
    name.downcase.split.join("-")
  end
end
