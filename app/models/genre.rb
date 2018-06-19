class Genre < ActiveRecord::Base

  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
    self.slug = @slug
    @slug
  end

  def self.find_by_slug(genre_slug)
    self.all.each do |genre|
      genre.slug
      genre.save
    end
    @genre = self.find_by(slug: genre_slug)
  end

end
