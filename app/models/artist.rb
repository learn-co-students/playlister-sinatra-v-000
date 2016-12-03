
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres

  attr_accessor :name

  # def initialize(name)
  #   @name = name

  # end


end