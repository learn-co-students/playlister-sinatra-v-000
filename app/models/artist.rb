class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  include Slugify::InstaceMethods
  extend Slugify::ClassMethods
end
