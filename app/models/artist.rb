class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    name = self.name.downcase
    split_name = name.split(" ")
    slug_name = split_name.join("-")
    slug_name
  end
  
  def self.find_by_slug(slug)
    split_slug = slug.split("-")
    name = split_slug.join(" ")
    @artist = ""
    Artist.all.each do |artist|
      if artist.name == name
        @artist = artist
      end
    end
    @artist
  end
end