class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    unslug = slug.split("-").join(" ")
    self.all.detect do |artist|
      artist.name.downcase == unslug
    end
  end

end