class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Song.find do |song|
      if song.slug == slug
         return song
      end
    end
  end
end
