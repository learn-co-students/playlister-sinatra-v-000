class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :genres, through: :songs 
  
  def slug
    @name = self.name
    @name.downcase.strip.gsub(' ', '-')
    @name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end 
  
  def self.find_by_slug(slug)
     @name = slug.split("-").map!{|word| word.capitalize}.join(" ")
     @name = slug.gsub(' ', '-').upcase
    
    special = ["with", "the", "a", "or", "and"]
    array = []
    slug.split("-").each do |word|
      if !special.include?(word)
        array << word.capitalize
      else
        array << word
      end
    end
    name = array.join(" ")
    self.find_by_name(name)
  end 
  
end 