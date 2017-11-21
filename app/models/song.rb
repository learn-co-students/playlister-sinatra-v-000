class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  def slug(name)
    slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def find_by_slug(slug)
  end
end
