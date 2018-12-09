class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
  
  def slug 
    self.name.downcase.gsub(/\W/, '-')
  end
  
  def self.find_by_slug(slug)
    unslug = slug.split('-').collect {|word| word.capitalize}.join(' ')
    self.find_by_name(unslug)
  end
  
end