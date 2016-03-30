class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, :through => :song_genres
  belongs_to :artist

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