class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :genres, :through => :songs
  
  def slug 
    merge_name = self.name.split(" ")
    downcase_name = merge_name.collect do |word|
      word.downcase
    end
    downcase_name.join("-")
  end
  
  def self.find_by_slug(slug)
    Artist.all.detect{|artist| artist.slug == slug}
  end
  
end