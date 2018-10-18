require_relative '../models/concerns/slugify'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods

end