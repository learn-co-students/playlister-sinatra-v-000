class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

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

# Genre.create(name: "Pop")
#   => #<Genre:0x007ff9990c94d8 id: 1, name: "Pop">
