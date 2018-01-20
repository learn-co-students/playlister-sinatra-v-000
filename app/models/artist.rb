class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    name = slug.split("-").map{|i| i.capitalize }.join(" ")
    Artist.find_by(name: "#{name}")
  end

  def slug
    self.name.downcase.split(" ").join("-")
  end
end
