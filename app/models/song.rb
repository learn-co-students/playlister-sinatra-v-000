class Song < ActiveRecord::Base
  extend Concerns::Slugifiable::ClassMethods
  include Concerns::Slugifiable::InstanceMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end
