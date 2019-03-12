class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres

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
    binding.pry
  end
end
