require_relative '../helper_methods/support_modules'

class Artist < ActiveRecord::Base 
  include Slugs

  has_many :songs
  has_many :genres, through: :songs
end