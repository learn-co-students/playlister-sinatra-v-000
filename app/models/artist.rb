class Artist < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods

  has_many :songs
  has_many :genres, through: :songs



end
