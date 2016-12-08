class Artist < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  include Displayable
  
  has_many :songs
  has_many :genres, through: :songs
end
