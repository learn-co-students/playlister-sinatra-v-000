class Artist <ActiveRecord::Base
  has_many :songs 
  has_many :genres, through: :song_genres
  has_many :song_genres
  
  def slug 
    self.name.gsub(/\s/,'-').downcase
  end 
  
  def self.find_by_slug(slug)
    Artist.all.each do |s|
      if s.slug == slug 
        return s
      end
    end
  end
  
end