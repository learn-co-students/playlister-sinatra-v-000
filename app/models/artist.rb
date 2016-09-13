class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


  def slug 
    self.name.downcase.gsub(/[" "]/, '-')
  end


  def self.find_by_slug(slug)
    artist = slug.split("-").map! {|el| el.capitalize}.join(" ")
    
    Artist.all.detect do |target|
      target.name = artist 
    end
  end

end