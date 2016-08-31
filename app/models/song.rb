class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

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

# Song.create(name: "Keep It Moving")
#   => #<Song:0x007ff9998c9020 id: 1, name: "Keep It Moving">
