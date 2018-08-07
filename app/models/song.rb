class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    name.downcase.strip.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    # binding.pry
    Song.all.find do |song|
      slug == song.slug
    end
  end
end
