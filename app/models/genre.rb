class Genre < ActiveRecord::Base
  has_many :artists, :through => :songs
  has_many :song_genres
  has_many :songs, :through => :song_genres
  
  def slug 
    self.name.downcase.gsub(/\W/, '-')
  end
  
  def self.find_by_slug(slug)
    unslug = slug.split('-').collect {|word| word.capitalize}.join(' ')
    self.find_by_name(unslug)
  end
  
end