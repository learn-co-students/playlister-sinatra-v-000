class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    real_name = self.name
    slug_name = real_name.downcase.gsub(" ","-")

    slug_name
  end

  def self.find_by_slug(slug)
    found_slug = Artist.all.find do |a|
      a.slug == slug
    end
    found_slug
  end
end
