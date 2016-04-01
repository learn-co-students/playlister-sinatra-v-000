class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def self.find_by_slug(slug)
  	x = Song.all.find do |a|
  		a.slug == slug
  		end
    x
  end

  def slug
  	x = self.name
  	x =  x.downcase.gsub(/[^a-z ]/,"").gsub(" ","-")
    x
  end


end
