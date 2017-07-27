class Artist < ActiveRecord::Base
  include Slugifiable::InstanceMethod
  extend Slugifiable::ClassMethods

    has_many :songs
    has_many :genres, through: :songs

end
