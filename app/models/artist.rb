class Artist < ActiveRecord::Base
  include Slugified::InstanceMethods
  extend Slugified::ClassMethods

  has_many :songs
  has_many :genres, :through => :songs


end
