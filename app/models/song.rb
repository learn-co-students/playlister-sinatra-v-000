class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slugified)
    Song.all.find { |name| name.slug == slugified }
  end
end
