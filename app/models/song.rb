class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
    self.slug_name = @slug
    self.save
    @slug
  end

  def self.find_by_slug(song_slug)
    self.all.each do |song|
      song.slug
    end
    @song = self.find_by(slug_name: song_slug)
  end

end
