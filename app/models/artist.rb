class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  extend Sluggify::ClassMethods
  include Sluggify::InstanceMethods
  
end