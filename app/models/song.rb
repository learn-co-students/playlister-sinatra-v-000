class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :songgenres
  has_many :genres, :through => :songgenres
end
