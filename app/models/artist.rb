class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    camel_slug = self.name.gsub! " ", "-"
    camel_slug.downcase
  end

  def self.find_by_slug(slug)
    name = slug.gsub! "-", " "
    matching_artist = Artist.find{ |artist| artist.name.downcase == name }
  end
end
