class Artist < ActiveRecord::Base

  # attr_accessor :name
  has_many :songs
  has_many :genres, :through => :songs

  # def initialize(name)
  #   @name = name
  # end

end
