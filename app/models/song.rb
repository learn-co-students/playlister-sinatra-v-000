class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name = self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.tr("-", " ").split.map(&:capitalize).join(' ')
    Song.find_by(name: name)
  end
end
