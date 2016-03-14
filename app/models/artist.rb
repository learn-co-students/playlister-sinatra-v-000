require_relative './concerns/slugification.rb'

class Artist < ActiveRecord::Base
  extend Slugification::ForClass
  include Slugification::ForInstance
  has_many :songs
  has_many :genres, through: :songs
end
