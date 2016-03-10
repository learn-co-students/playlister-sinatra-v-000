require 'pry'
class Artist < ActiveRecord::Base
  binding.pry
  has_many :songs
  has_many :artist_genres
  has_many :genres, through: artist_genres

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").each { |word| word.capitalize }.join(" ")
    self.find_by(name: "name")
  end

end