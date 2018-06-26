class Artist <ActiveRecord::Base
  has_many :songs 
  has_many :genres, through: :song_genres
  has_many :song_genres
  
  def slug 
    self.name.gsub!(/\s/,'-')
  end 
  
end