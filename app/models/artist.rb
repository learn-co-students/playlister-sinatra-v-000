class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.find do |artist|
      if slug == artist.slug
        artist
      end
    end
  end
end
