class Artist < ActiveRecord::Base
  extend Sluggable::ClassMethods
  include Sluggable::InstanceMethods
  
  has_many :songs
  has_many :genres, through: :songs
end