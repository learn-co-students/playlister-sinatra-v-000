class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  extend Slugs::ClassMethods
  include Slugs::InstanceMethods

end