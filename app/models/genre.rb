class Genre < ActiveRecord::Base 
    has many :songs, through: :songgenres
    has many :artists
end