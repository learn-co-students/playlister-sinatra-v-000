class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    #no_slug = slug.split("-").map(&:capitalize).join(" ")
    no_slug = slug.split("-").join(" ")
    #Genre.find_by name: no_slug
    genre = Genre.select do |genre|
      genre.name.downcase == no_slug
    end
    genre[0]
  end

end
