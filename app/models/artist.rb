class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    unslug = slug.split("-").join(" ")
    self.all.detect {|a| a.name.downcase == unslug}
  end

end
