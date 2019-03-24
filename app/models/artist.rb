class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(" ").map { |name| name.downcase }.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find {|artist| artist.slug == slug}
  end
end
