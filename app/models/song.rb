class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
  # validates_uniqueness_of :name


  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
