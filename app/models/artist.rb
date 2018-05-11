class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slug = self.name.gsub(/[\u0080-\u00ff]/, "").gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    found = nil
    self.all.each do |artist|
      if artist.slug == slug
        found = artist
      end
    end
    found
  end
end
