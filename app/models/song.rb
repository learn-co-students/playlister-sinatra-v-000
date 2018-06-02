require_relative 'concerns/persistable'

class Song < ActiveRecord::Base
  include Persistable::InstanceMethods
  extend Persistable::ClassMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end