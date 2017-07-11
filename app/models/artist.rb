class Artist < ActiveRecord::Base
  # extend Slugify::ClassMethod
  include Slugify::InstanceMethod

  has_many :songs
  has_many :genres, through: :songs
end