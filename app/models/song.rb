require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    slug = slug.split("-").map {|word| word.capitalize}.join(" ")
    Song.find_by(name: slug)
  end
end