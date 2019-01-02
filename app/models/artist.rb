require_relative './concerns/slugify'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
end
