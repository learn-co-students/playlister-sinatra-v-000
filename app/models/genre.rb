class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    @@name = slug.gsub("-", " ")
    Genre.all.detect {|genre| genre.name.downcase == @@name}
  end

end
