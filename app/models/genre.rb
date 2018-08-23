class Genre < ActiveRecord::Base
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  
  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
    
  def self.find_by_slug(slug)
    Genre.all.detect{|v| v.slug == slug}
  end
  
end