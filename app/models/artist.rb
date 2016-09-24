class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  extend SlugModule::ClassMethods
  include SlugModule::InstanceMethods

end
