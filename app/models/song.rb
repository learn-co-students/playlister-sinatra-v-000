class Song < ActiveRecord::Base
  #name
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    Slugifiable.new.slug(self.name)
  end

  def self.find_by_slug(slug)
    self.all.find{|a| Slugifiable.new.slug(a.name)==slug}
  end
end
