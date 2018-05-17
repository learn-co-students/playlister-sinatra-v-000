class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres
  has_many :genres, through: :songs

  def slug
    name = self.name.downcase
    name_array = name.split(" ")
    name_array.join("-")
  end

  def self.find_by_slug(slug)
    slug_array = slug.split("-")
    name_joined = slug_array.join(" ")
    self.all.each do |artist|
      if artist.name.casecmp(name_joined) == 0
        return artist
      end
    end
  end

end
