class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    if self.name.include?(' ')
      camel_slug = self.name.gsub " ", "-"
      camel_slug.downcase
    else
      self.name.downcase
    end
  end

  def self.find_by_slug(slug)
    if slug.include?('-')
      name = slug.gsub "-", " "
      matching_song = Song.find{ |song| song.name.downcase == name }
    else
      matching_song = Song.find{ |song| song.name.downcase == slug }
    end
  end
end
