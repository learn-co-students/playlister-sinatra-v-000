class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres

  # binding.pry
  #
  # def initialize(name)
  #   @name = name
  # end

end
