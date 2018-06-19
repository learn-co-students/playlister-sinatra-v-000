class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
    self.slug_name = @slug
    self.save
    @slug
  end

  def self.find_by_slug(artist_slug)
    self.all.each do |artist|
      artist.slug
    end
    @artist = self.find_by(slug_name: artist_slug)
  end

end
