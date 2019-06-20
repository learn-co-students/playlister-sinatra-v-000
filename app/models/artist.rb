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
    split_slug.each do |word|
      word.capitalize!
    end
    name = split_slug.join(" ")
    self.find_by(name: name)
  end
end