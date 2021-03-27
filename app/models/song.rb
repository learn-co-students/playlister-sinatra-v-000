class Song < ActiveRecord::Base
  # Reviewed solution - I needed to update my associations here too once I added the join table
  # Because songs have many genres but through the join table, needed to update my original
  # as well as indicate has_many :song_genres
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub(/[" "]/,"-")
  end

  def self.find_by_slug(slug)
    Song.all.find {|song| song.slug == slug}
  end

end
