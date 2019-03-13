class Genre < ActiveRecord::Base
  has_many :song_genres #any time through is needed you need has many of something first
  #join table comes first ^ because a bridge is always needed
  has_many :songs, through: :song_genres #activerecord associations
  #like the bridge in artist class,

  has_many :artists, through: :songs #think in terms of links

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
    Genre.find_by(name: name) #uses find_by instead of find because of attribute
  end
end
