class Artist < ActiveRecord::Base
  include Slugfiable::InstanceMethods
  extend Slugfiable::ClassMethods

  has_many :songs
  has_many :genres, through: :songs
end
