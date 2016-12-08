
class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug
    if self.name
      name.downcase.gsub(/ /, '-')
    end
  end

  def self.find_by_slug(slug)
    Song.all.find {|song| song.slug == slug}
  end

end