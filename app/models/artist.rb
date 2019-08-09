class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
  has_many :songs
  #has_many :artist_genres
  has_many :genres, through: :songs #through: :artist_genres
  # has_many :genres
  
  # def slug
  #   # Lowercase the object's name, and replace blank spaces with -
  #   name.downcase.split.join("-")
  # end
  # 
  # def self.find_by_slug(slug)
  #   # Find the object of this class whose name can be changed into the given slug.
  #   # Use the #slug instance method.
  #   
  #   self.all.detect {|artist| artist.slug == slug}
  # end
end