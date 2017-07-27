require 'pry'
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
  	#take the artists name
  	#add '-' instead of spaces
  	@artist = self.name
  	@artist.parameterize('-')
  end

  def self.find_by_slug(slug)
     Artist.all.find do |artist|
       artist.slug == slug
     end
   end
end