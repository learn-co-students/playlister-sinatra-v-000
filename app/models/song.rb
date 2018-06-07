class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.split(' ').join('-').downcase.chomp
  end

  def self.find_by_slug(song_name)
    Song.all.detect {|s| s.slug == song_name}
  end
end
