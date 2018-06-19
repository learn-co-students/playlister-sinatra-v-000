class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
    self.slug = @slug
    @slug
  end

  def self.find_by_slug(artist_slug)
    self.all.each do |artist|
      artist.slug
      artist.save
    end
    @artist = self.find_by(slug: artist_slug)
  end

end
