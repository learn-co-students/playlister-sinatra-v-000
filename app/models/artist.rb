class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres
  has_many :genres, through: :songs

  def slug
      self.name.gsub(/ /, '-').downcase 
  end

  def self.find_by_slug(slug)
    artist_name = slug.gsub(/-/, ' ')
    #artist_name = artist_name.split.map {|w| w.capitalize }.join(' ')
    artist_name = artist_name.titleize
    Artist.find_by name: artist_name
  end

end
