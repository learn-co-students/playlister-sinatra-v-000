require 'pry'
class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: 'songs'

  def slug
    name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Artist.all.find do |artist|
# iterates through Artist array, slugs the artist, then matches to the input (slug)
      binding.pry
      artist.slug == slug
    end
  end

end
