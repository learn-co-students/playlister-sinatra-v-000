require_relative 'concerns/persistable'

class Genre < ActiveRecord::Base
  include Persistable::InstanceMethods
  extend Persistable::ClassMethods

  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  has_many :song_genres

end