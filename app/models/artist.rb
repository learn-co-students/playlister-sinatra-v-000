require_relative '../models/concerns/slugifiable'

class Artist < ActiveRecord::Base
  extend Concerns::ClassMethods
  include Concerns::Slugifiable
  
  has_many :songs
  has_many :genres, through: :songs
end
