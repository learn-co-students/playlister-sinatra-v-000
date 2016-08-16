class Artist < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  # An Artist can have multiple songs and multiple genres
  has_many :songs
  has_many :genres, :through => :songs



end
