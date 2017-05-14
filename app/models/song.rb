class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
  	self.name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase

  end

  def self.find_by_slug(name)
  
  	
  	self.all.detect{|a|  a.slug == name }



  end

end