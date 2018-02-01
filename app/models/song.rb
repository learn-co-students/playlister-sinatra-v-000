class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :song_genres
  belongs_to :artist
  has_many :genres,  through: :song_genres
end
