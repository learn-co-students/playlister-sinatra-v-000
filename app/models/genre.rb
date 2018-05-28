class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  # should move this logic to a module maybe
  def slug ()
    name = self.read_attribute(:name)
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug (slug)
    self.all.find { |genre| genre.slug == slug }
  end
end
