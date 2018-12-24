class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

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
      matching_artist = Artist.find{ |artist| artist.name.downcase == name }
    else
      matching_artist = Artist.find{ |artist| artist.name.downcase == slug }
    end
  end
end
