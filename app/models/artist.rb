class Artist < ActiveRecord::Base 
    has many :songs
    has many :artists
end