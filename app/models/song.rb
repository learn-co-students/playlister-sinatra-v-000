class Song < ActiveRecord::Base
  has_many :song_genres
  belongs_to :artist
  has_many :genres, through: :song_genres

  def slug
    name.parameterize
  end

  def self.find_by_slug(slug)
    self.all.find{|item| item.slug == slug}
  end
end
