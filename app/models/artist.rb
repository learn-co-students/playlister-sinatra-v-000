require 'pry'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
#binding.pry
  def slug
    self.name.split.collect do |word|
      #binding.pry
      word.downcase!.gsub(/\W/,"")
    end.join("-")
  end

  def self.find_by_slug(slug)
    Artist.all.select do |artist|
      artist.slug == slug
    end[0]
  end
end
