class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::KlassMethods
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist
end
