class Song < ActiveRecord::Base
  belongs_to :artists
  has_many :genres
  
end