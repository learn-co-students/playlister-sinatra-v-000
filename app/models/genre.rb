class Genre < ActiveRecord::Base
  #the order matters here. we cannot define a :through
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    #"Hotline Bling" => hotline-bling
    name.downcase.split(/\s*\W/).join("-")
  end

  def self.find_by_slug(slug)
    #binding.pry
    Genre.all.find {|genre| genre.slug == slug}
  end

end
