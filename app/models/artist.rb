class Artist < ActiveRecord::Base
  # attr_accessor :genre_ids #temporary
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :songs
  has_many :genres, through: :songs
end
