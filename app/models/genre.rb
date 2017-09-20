class Genre < ActiveRecord::Base
  has_many :song_genres #Remember to include 'has_many' with the join table!
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    Slugify.toSlug(self.name)
  end

  def self.find_by_slug(slug)
    self.all.select do |genre|
      genre.slug == slug
    end.first
  end
end
