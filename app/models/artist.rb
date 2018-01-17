class Artist < ActiveRecord::Base
  require_relative './concerns/slugifiable'
  include Slugifiable
  extend Findable
  
  has_many :songs
  has_many :genres, through: :songs
end