# require_relative './Useful'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  extend  Useful::ClassMethods
  include Useful::InstanceMethods

  # @@genres = []
  # def genres
  #   self.songs.each {|song| @@genres << song.genres}
  #   @@genres
  # end

  # def slug
  #   self.name.downcase.split(" ").join("-")
  # end
  #
  # def self.find_by_slug(slug)
  #   artist = Artist.all.each {|artist| artist.slug == slug}
  #   artist.first
  # end
end
