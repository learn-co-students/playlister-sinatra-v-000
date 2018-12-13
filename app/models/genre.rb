class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    #slug_name = self.name
    #slug_name.downcase.gsub(" ","-")
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Genre.all.find{|genre| genre.slug == slug}
  end

end
