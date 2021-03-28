require_relative '../models/concerns/slugable.rb'

class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    extend Slugable::ClassMethods
    include Slugable::InstanceMethods
end
  