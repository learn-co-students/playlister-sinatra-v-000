require_relative './concerns/slugify.rb'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
end
