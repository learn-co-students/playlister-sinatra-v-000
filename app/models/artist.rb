class Artist < ActiveRecord::Base 
  has_many :songs 
  has_many :genres, through: :songs
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  
  # An Artist can have multiple songs and multiple genres
  
end