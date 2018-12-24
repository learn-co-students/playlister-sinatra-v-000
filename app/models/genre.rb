class Genre < ActiveRecord::Base
  has_many :artists
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    camel_slug = self.name.gsub! " ", "-"
    camel_slug.downcase
  end

  def self.find_by_slug(slug)
    name = slug.gsub! "-", " "
    matching_genre = Genre.find{ |genre| genre.name.downcase == name }
  end
end
