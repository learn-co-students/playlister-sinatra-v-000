require_relative "./concerns/slugifiable.rb"

class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  self.include Slugifiable::InstanceMethods 
  # The self keyword is needed because "include" is a Sinatra keyword, too.
  
  # Whatever I extended or included didn't work, somehow...
  
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