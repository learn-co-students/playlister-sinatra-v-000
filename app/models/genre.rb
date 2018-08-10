class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name = self.name
    split = name.split(" ")
    downcased = []
    split.map {|word| downcased << word.downcase}
    joined = downcased.join("-")
    joined
  end

  def self.find_by_slug(slug)
    Genre.all.find do |genre|
      genre.slug == slug
    end
  end
end
