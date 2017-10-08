class Artist < ActiveRecord::Base
  extend Concerns::Slugifiable::ClassMethods
  include Concerns::Slugifiable::InstanceMethods

  has_many :songs
  has_many :genres, through: :songs
end
