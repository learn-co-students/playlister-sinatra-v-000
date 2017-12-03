class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Artist.find do |artist|
      if artist.slug == slug
         return artist
      end
    end
  end
end
