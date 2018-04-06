class Song < ActiveRecord::Base
  belongs_to :artist

  has_many :song_genres
  has_many :genres, through: :song_genres

  attr_accessor :genre

  def slug
    self.name.split(" ").join("-").downcase
  end

  def genre
    self.genre
  end
end
