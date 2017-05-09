class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    new_slug = slug.downcase.split('-').join(' ')
    Genre.find_by("lower(name) = ?", new_slug)
  end
end
