class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods #moved slug methods into concerns
  extend Slugifiable::ClassMethods #moved slug methods into concerns

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
