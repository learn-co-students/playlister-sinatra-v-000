require 'pry'
class Artist < ActiveRecord::Base

  include Slug
  extend Slug_Cl

  has_many :songs
  has_many :genres, through: :songs

end
