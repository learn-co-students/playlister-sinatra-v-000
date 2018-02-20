class Genre < ActiveRecord::Base
    has_many :songgenres
    has_many :songs, through: :songgenre
    has_many :artists, through: :songs
end