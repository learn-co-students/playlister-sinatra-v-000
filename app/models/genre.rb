class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
  	self.name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase

  end

  def self.find_by_slug(name)
  
  	
  	self.all.detect{|a|  a.slug == name }



  end  
end