class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs,  through: :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres

  def slug
    @slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    self.name = @slug
  end

  def self.find_by_slug(slug)
    new_slug = slug.gsub("-", " ").split(/ |\_/).map(&:capitalize).join(" ")
    Genre.find_by(name: new_slug)
  end



end
