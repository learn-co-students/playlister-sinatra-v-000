class Genre < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :songs, through: :song_genres
  has_many :song_genres #JOIN MODEL
  has_many :artists, through: :songs

  # def initialize(genre)
  #   Genre.all << self unless Genre.all.include?(genre) #not working
  # end

end
