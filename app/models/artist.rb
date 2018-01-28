class Artist < ActiveRecord::Base
  include Slugible::InstanceMethods
  extend Slugible::ClassMethods

  has_many :songs
  has_many :genres, through: :songs
end
