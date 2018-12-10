class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :genres, :through => :songs
  
  
  def slug 
    self.name.downcase.gsub(/\W/, '_')
  end
  
  def self.find_by_slug(slug)
    unslug = slug.split('_').collect {|word| word.capitalize}.join(' ')
    self.find_by_name(unslug)
  end
  
end