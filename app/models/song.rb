class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.split(/\W/).reject { |w| w.empty? }.join("-")
  end

  def self.find_by_slug(slug)
    # use FIND method to find song from Song.all whos slug == slug argument provided
    Song.all.find{|song| song.slug == slug}
  end
end
