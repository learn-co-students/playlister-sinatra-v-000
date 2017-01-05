class Song < ActiveRecord::Base

  include Concerns::Slugifiable::InstanceMethods
  extend Concerns::Slugifiable::ClassMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
