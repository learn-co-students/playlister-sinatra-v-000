class Genre < ActiveRecord::Base

  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
    self.slug_name = @slug
    self.save
    @slug
  end

  def self.find_by_slug(genre_slug)
    self.all.each do |genre|
      genre.slug
    end
    @genre = self.find_by(slug_name: genre_slug)
  end

end
