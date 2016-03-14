require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").map {|word| word.capitalize }.join(" ")
    self.find_by(name: slug)
  end
end
