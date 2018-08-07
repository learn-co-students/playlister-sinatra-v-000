require_relative 'concerns/slugify'

class Artist < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
  
  has_many :songs
  has_many :genres, through: :songs

end
