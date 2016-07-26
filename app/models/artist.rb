class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(" ").map { |name| name.downcase }.join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map { |name| name.capitalize }.join(" ")
    self.find_by_name(name)
  end

end
