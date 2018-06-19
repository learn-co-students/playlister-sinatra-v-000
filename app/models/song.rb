class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
    self.slug = @slug
    @slug
  end

  def self.find_by_slug(song_slug)
    self.all.each do |song|
      song.slug
      song.save
    end
    @song = self.find_by(slug: song_slug)
  end

end
