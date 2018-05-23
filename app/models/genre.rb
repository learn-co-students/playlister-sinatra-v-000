class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    slug_name = self.name.gsub(' ', '-')
    slug_name = slug_name.gsub(/[^-a-zA-Z0-9$_.+!*()]/, "")
    slug_name = slug_name.downcase
    slug_name
  end

  def self.find_by_slug(slug)
    self.all.find do |gen|
      gen.slug == slug
    end
  end
end
