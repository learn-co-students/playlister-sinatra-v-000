class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    new_slug = slug.downcase.split('-').join(' ')
    Song.find_by("lower(name) = ?", new_slug)
  end
end
