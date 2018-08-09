class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres
  attr_accessor :name, :params, :song, :genres, :artist


end
