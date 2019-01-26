class SongGenre < ActiveRecord::Base
  belongs_to :artists 
  has_many :genres
  
end