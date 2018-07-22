class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    name.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end

  #use slug method to retrieve name from database
  def self.find_by_slug(slug)
    Genre.all.find{|artist| artist.slug == slug}
  end
end
