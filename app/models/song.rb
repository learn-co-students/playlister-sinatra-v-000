class Song < ActiveRecord::Base
  belongs_to :artist

  has_many :song_genres
  has_many :genres, through: :song_genres


  def slug
    name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    all_songs = Song.all
    song = all_songs.find do |song|
              song.slug == slug
            end
    return song
  end


end
