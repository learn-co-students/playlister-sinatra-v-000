class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  extend Slugified::ClassMethods
  include Slugified::InstanceMethods
end
