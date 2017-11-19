class Artist < ActiveRecord::Base
  include Slugifiable::InstanceMethods #moved slug methods into concerns
  extend Slugifiable::ClassMethods #moved slug methods into concerns

  has_many :songs
  has_many :genres, through: :songs
end
