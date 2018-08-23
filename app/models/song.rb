class Song < ActiveRecord::Base 
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  
  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
    
  def self.find_by_slug(slug)
    Song.all.detect do |v|
      v.slug == slug
    end
  end
  
end