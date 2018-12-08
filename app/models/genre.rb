class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres
  
  def slug
    title = self.name
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    slug
  end
  
  def self.find_by_slug(slug)
    unslug = slug.gsub('-', ' ').gsub(/\S+/, &:capitalize)
    Genre.all.each do |art|
      if art.name.include?(unslug)
       return art
      end 
    end 
  end 
  
end 