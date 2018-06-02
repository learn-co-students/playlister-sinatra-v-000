require_relative 'concerns/persistable'

class Artist < ActiveRecord::Base
  include Persistable::InstanceMethods
  extend Persistable::ClassMethods

  has_many :songs
  has_many :genres, through: :songs

end