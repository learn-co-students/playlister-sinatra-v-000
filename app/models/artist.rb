#require 'slugifyer'

class Artist < ActiveRecord::Base
  #extend Slugifyer::ClassMethods
  #include Slugifyer::InstanceMethods
  
  has_many :songs
  has_many :genres, through: :songs
end