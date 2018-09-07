class Song < ActiveRecord::Base 
  belongs_to :artists
  has_many :songs 
  has_many :genres, :through => :songs 
end