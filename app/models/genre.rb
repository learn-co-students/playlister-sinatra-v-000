class Genre < ActiveRecord::Base
  require_relative '../models/concerns/slugifiable.rb'
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :artists
  has_many :songs
end