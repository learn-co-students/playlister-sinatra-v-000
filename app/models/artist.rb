class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethdods

  has_many :songs
  has_many :genres, through: :songs

end
