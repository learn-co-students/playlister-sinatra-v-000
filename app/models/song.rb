class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def self.find_by_slug(slug)
    self.all.detect { |e| e.slug == slug }
  end

  def slug
    name.downcase.split.join("-")
  end
end
