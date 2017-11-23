class Genre < ActiveRecord::Base
  include Slugifiable
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def self.find_by_slug(slug)
   self.all.find { |s| s.slug == slug }
  end
end
