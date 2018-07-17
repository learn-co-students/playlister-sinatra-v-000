class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    @slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    self.name = @slug
  end

  def self.find_by_slug(slug)
    new_slug = slug.gsub("-", " ").split(/ |\_/).map(&:capitalize).join(" ")
    Song.find_by(name: new_slug)
  end

end
