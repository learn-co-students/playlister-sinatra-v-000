
class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(" ","-")
  end
def self.find_by_slug(slug)
   name = slug.split("-").map { |word| word.capitalize }.join(" ")
   self.find_by_name(name)
  end
end
