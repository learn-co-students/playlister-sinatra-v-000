class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def slug
    self.name.downcase.strip.gsub(' ','-')
  end

  def self.find_by_slug(name)
    Song.all.find{|song| song.slug == name}
    end
end
