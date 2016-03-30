class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

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