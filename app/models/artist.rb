class Artist < ActiveRecord::Base
  has_many :song_genres
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Artist.all.find do |artist|
      if artist.slug.include?(slug)
        Artist.find_by(name: artist.name)
      end
    end
  end
end
