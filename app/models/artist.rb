class Artist < ActiveRecord::Base
  require 'pry'
  has_many :songs
  has_many :genres, :through => :songs

  def slug 
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end
end
