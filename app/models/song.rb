class Song < ActiveRecord::Base
  include Slugified::InstanceMethods
  extend Slugified::ClassMethods
has_many :genres, :through => :song_genres
has_many :song_genres
belongs_to :artist
end
