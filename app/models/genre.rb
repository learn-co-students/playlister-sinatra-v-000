class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug(name)
    slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def find_by_slug(slug)
  end
end
