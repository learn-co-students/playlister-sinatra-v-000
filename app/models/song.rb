class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  # should move this logic to a module maybe
  def slug ()
    name = self.read_attribute(:name)
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug (slug)
    self.all.find { |song| song.slug == slug }
  end
end
