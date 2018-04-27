class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(artist_name)
    Artist.all.find do |artist|
      artist.name.downcase == artist_name.gsub('-', ' ')
    end
  end


end
