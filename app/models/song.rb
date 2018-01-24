class Song < ActiveRecord::Base
  belongs_to :Artist
  has_many :Song
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
  slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  slug
  end

  def self.find_by_slug(slug)
    all.each do |song|
      if slug == song.slug
        return song
      end
    end
  end
end
