class Artist < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods

  has_many :songs
  has_many :genres, through: :songs

end
