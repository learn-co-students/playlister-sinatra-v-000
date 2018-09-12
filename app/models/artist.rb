class Artist < ActiveRecord::Base
  require_relative '../models/concerns/slugifiable.rb'
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :songs
  has_many :genres, :through => :songs
end