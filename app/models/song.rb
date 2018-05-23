class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    slug_name = self.name.gsub(' ', '-')
    slug_name = slug_name.gsub(/[^-a-zA-Z0-9$_.+!*()]/, "")
    slug_name = slug_name.downcase
    slug_name
  end

  def self.find_by_slug(slug)
    self.all.find do |song|
      song.slug == slug
    end
  end
end
