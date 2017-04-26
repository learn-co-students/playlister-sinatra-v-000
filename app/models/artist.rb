class Artist < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods
  has_many :songs
  has_many :genres, through: :songs
end
