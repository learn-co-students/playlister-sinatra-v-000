class Genre < ActiveRecord::Base
  has_many :artists, :through => :songs
  has_many :songs, :through => :song_genres
  has_many :song_genres

  def slug
    #strip special characters and replace with -
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(arg)
    #binding.pry
    Genre.all.find{|genre| genre.slug == arg}
  end
end
