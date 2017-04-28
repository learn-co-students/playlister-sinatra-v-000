class Artist < ActiveRecord::Base
  attr_accessor :slug

  has_many :songs
  has_many :genres, through: :songs

  def slug
    @slug = self.name.gsub(" ", "-").downcase
    @slug
  end

  def self.find_by_slug(slug)
    Artist.all.each do |artist|
      if artist.slug == slug
        return artist
      end
    end
  end
end
