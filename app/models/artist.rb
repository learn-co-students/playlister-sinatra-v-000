class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    artist = self.name
    "#{artist.gsub(/\W/, "-").squeeze("-")}".downcase
  end

  def self.find_by_slug(slug)
    name_array = slug.split("-")
    name_array.collect do |word|
      word.capitalize!
    end
    slug = name_array.join("-")
    @artist = Artist.find_by name: slug.sub("-", " ")
  end
end
