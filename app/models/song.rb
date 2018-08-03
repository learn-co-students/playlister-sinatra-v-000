class Song < ActiveRecord::Base 
    belongs to :artist
    has many :genres, through: :songgenres
end