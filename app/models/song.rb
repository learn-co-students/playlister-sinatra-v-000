class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  def slug
    name = self.name.downcase
    split_name = name.split(" ")
    slug_name = split_name.join("-")
    slug_name
  end
  
  def self.find_by_slug(slug)
    split_slug = slug.split("-")
    split_slug.each do |word|
      word.capitalize!
    end
    name = split_slug.join(" ")
    self.find_by(name: name)
  end
end