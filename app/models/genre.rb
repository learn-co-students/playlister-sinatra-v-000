class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs 

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    #self.name.gsub(" ","-").downcase
  end

  def self.find_by_slug(slug)
    self.all.each do |object|
      @name = object.name if object.slug == slug 
    end
    self.find_by(:name => @name)
  end


end