class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    name = []
    slug.split("-").each {|w| name << w.capitalize}
    find_by(name: name.join(" "))
  end

end
