class Genre < ActiveRecord::Base
  # has_many :artists
  # has_many :songs
  # belongs_to :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
  slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  slug
  end

  def self.find_by_slug(slug)
    @@all.each do |song|
      if song.name.slug == slug
        return song
      end
    end
  end
end
