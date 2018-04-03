class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable

  

  def self.find_by_slug(name)
    artist_name = name.gsub(/-/, " ").split(" ").map do |word|
      word.capitalize
    end.join(" ")
    self.find_by(name: artist_name)
  end

  
  
end
