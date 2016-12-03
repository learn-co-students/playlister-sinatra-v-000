
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  attr_accessor :name

  def slug
    self.name.downcase.gsub(/ /, '-')
  end

  def self.find_by_slug(slug)
    name = slug.split('-').map {|x| x.capitalize}.join(' ')

    artist = Artist.find_by(:name => name)
    #binding.pry
    artist

  end


end