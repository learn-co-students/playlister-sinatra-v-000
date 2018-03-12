class Artist < ActiveRecord::Base
  include Concerns::Slugifiable::InstanceMethods
  extend Concerns::Slugifiable::ClassMethods

  has_many :songs
  has_many :genres, -> { distinct }, through: :songs
end
