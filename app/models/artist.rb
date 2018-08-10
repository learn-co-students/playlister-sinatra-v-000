require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name = self.name
    split = name.split(" ")
    downcased = []
    split.map {|word| downcased << word.downcase}
    joined = downcased.join("-")
    joined
  end

  def self.find_by_slug(slug)
    Artist.all.find do |artist|
      artist.slug == slug
    end
  end
end
