require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|s| slug == s.slug}
    # slug_array = slug.split("-")
    # name = slug_array.map {|w| w.capitalize}.join(" ")
    # self.find_by(name: name)
  end

end
