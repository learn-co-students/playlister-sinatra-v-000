class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    sluged_artist = ""

    self.all.each do |artist|
      if artist.slug == slug
         sluged_artist = artist
      end

    end
      sluged_artist
  end
end
