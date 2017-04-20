class Artist < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods

  has_many :songs
  has_many :genres, through: :songs

end
