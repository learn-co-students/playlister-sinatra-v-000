class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    unslug = slug.gsub('-', ' ')
    all_songs = Song.all
    all_songs.each do |song|
      if song.name.downcase == unslug
        return song
      end
    end
  end

end
