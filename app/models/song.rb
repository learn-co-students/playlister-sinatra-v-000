class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug_name)
    Song.all.each do |song|
      if song.slug == slug_name
        return song
      end
    end
  end

end
