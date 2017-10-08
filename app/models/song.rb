class Song < ActiveRecord::Base
  extend Concerns::Slugifiable::ClassMethods
  include Concerns::Slugifiable::InstanceMethods

  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres
end
