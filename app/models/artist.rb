class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
  	self.name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase

  end

  def self.find_by_slug(name)
  	
  	
  	self.all.detect{|a|  a.slug == name }



  end


end