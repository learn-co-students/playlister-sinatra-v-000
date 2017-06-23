class Song < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :song_genres
  has_many :genres, through: :song_genres

  belongs_to :artist

  def song_ids
   end

end
