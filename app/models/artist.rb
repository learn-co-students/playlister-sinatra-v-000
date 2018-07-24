
class Artist < ActiveRecord::Base
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  has_many :songs
  has_many :genres, through: :songs
end