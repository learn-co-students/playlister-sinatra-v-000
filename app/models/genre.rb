class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  
end
