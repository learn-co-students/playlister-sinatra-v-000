class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find{|instance| instance.slug == slug}
  end
end
