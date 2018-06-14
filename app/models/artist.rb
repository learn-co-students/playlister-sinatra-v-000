class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    converted_slug = slug.split("-").join(" ").titleize
    self.all.find{|artist| artist.name == converted_slug}
  end
end
