class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    unslug = slug.gsub('-', ' ')
    all_artists = Artist.all
    all_artists.each do |artist|
      if artist.name.downcase! == unslug
        artist.name = artist.name.titleize
        return artist
      end
    end
  end

end
