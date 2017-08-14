class Song < ActiveRecord::Base

  belongs_to :artist # song belongs to an artist, so song table will have artist_id
  has_many :song_genres # song can have many genres
  has_many :genres, through: 'song_genres' # a song has many genres through song_genres

  def slug(name)
    name.gsub(" ", "-").downcase
  end

end
