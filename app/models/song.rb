class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    @slug = self.name.gsub(" ", "-").downcase
    @slug
  end

  def self.find_by_slug(slug)
    Song.all.each do |song|
      if song.slug == slug
        return song
      end
    end
  end

end
