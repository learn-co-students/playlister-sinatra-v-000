class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    # "Taylor Swift"
    # => "taylor-swift"
    name_array = self.name.split
    downcase_array = []
    name_array.each do |name|
      downcase_array << name.downcase
    end
    slug = downcase_array.join("-")
    slug
  end

  def self.find_by_slug(slug)
    name_array = slug.split("-")
    capital_array = []
    name_array.each do |name|
      capital_array << name.capitalize
    end
    name = capital_array.join(" ")
    name
    self.find_by(name: name)
  end

end

# Artist.create(name: "Tiana")
#   => #<Artist:0x007ff56189b468 id: 1, name: "Tiana">
