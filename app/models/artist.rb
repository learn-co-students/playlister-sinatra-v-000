class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slug_name = self.name.gsub(' ', '-')
    slug_name = slug_name.gsub(/[^-a-zA-Z0-9$_.+!*()]/, "")
    slug_name = slug_name.downcase
    slug_name
  end

  def self.find_by_slug(slug)
    self.all.find do |art|
      art.slug == slug
    end
  end

end
