class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres

  def slug
    binding.pry
    self
  end
end
