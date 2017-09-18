class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres #Remember to include 'has_many' with the join table!
  has_many :genres, through: :song_genres
  def slug
    Slugify.toSlug(self.name)
  end

  def self.find_by_slug(slug)
    self.all.select do |song|
      song.slug == slug
    end.first
  end
end
