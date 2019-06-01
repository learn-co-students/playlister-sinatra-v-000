class Song < ActiveRecord::Base 
  belongs_to :artist 
  has_many :song_genres
  has_many :genres, through: :song_genres 
  
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