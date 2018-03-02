class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    self.name.downcase.scan(/[a-z0-9]+/).join('-')
  end

  def self.find_by_slug(slug)
    self.all.find { |e| e.slug == slug }
  end
end
