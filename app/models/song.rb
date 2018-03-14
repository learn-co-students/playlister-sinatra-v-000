class Song < ActiveRecord::Base
  has_many :genres, through: :song_genres
  has_many :song_genres
  belongs_to :artist

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Song.all.find do |song|
      if song.slug.include?(slug)
        Song.find_by(name: song.name)
      end
    end
  end

end
