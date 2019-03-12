class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slug = self.name.downcase
    slug = slug.split(" ") #it splits replaces nonword chars in each word than joins with -
    slug_array = []
    slug.map! do |word|
      slug_array << word.gsub(/\W/,"") #every nonword char, gsub is a replacement method
    end
    slug_array = slug_array.join("-")
    slug = slug_array
    slug
  end

  def self.find_by_slug(slug)
    name = slug.split("-")
    full_name = []
    name.each do |word|
      full_name << word.capitalize
    end
    name = full_name.join(" ")
    Artist.find_by(name: name) #uses find_by instead of find because of attribute
  end
end
