class Artist < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  has_many :genres, through: :songs
  has_many :songs
end
