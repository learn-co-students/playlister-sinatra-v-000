class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :genres #or has_many :genres, through: :songs 

end
