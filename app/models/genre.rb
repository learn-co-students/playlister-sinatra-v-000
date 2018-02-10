class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  def slug
    genre = self.name
    "#{genre.gsub(/\W/, "-").squeeze("-")}".downcase
  end

  def self.find_by_slug(slug)
    name_array = slug.split("-")
    name_array.collect do |word|
      word.capitalize!
    end
    slug = name_array.join("-")
    @genre = Genre.find_by name: slug.sub("-", " ")
  end
end
