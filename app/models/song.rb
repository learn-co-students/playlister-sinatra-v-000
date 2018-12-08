class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  def slug
    title = self.name
    slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    slug
  end
  
  def self.find_by_slug(slug)
    unslug = slug.gsub('-', ' ').gsub(/\S+/, &:capitalize)
    #unslug = un.slice(0, un.index('('))
    Song.all.each do |art|
     y = art.name
     x = y.tr('()', '')
     w = x.tr('.,&','').gsub(/\S+/, &:capitalize)
      if w == unslug
       return art
      end 
    end 
  end 
  
  
end 
  