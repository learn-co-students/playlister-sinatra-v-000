class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  include Slugifiable::InstanceMethods    #give an error uninitialized constant
  extend Slugifiable::ClassMethods        #give an error uninitialized constant

end
