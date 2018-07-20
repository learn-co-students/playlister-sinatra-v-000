class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    slug = self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    slug = slug.split("-")
    slug.collect do |word|
      word.capitalize!
    end
    slug = slug.join(" ")
    self.find_by_name(slug)
  end
end
