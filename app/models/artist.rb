class Artist < ActiveRecord::Base 
  #include Slugifiable
  
  has_many :songs 
  has_many :genres, through: :songs
  
  
  def slug  
    @slug = self.name.downcase.split(' ').join('-')
  end 
  
  def self.find_by_slug(slug)
    a = slug.split('-')
    b = a.collect {|new| new.capitalize}
    name = b.join(' ')

    search_result = self.find_by("name" => name)
  end 
  
end 