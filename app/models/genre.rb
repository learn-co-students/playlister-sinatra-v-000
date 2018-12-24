class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    if self.name.include?(' ')
      camel_slug = self.name.gsub " ", "-"
      camel_slug.downcase
    else
      self.name.downcase
    end
  end

  def self.find_by_slug(slug)
    if slug.include?('-')
      name = slug.gsub "-", " "
      matching_genre = Genre.find{ |genre| genre.name.downcase == name }
    else
      matching_genre = Genre.find{ |genre| genre.name.downcase == slug}
    end
  end
end
