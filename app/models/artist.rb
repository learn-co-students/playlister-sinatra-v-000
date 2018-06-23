class Artist < ActiveRecord::Base

  require_relative '../models/concerns/slugifiable'

  has_many :songs
  has_many :genres, :through => :songs

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end
