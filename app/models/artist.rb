class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres


  def slug
    self.name.downcase.strip.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    Artist.all.each do |artist|
      if artist.slug == slug
        @artist = artist
      end
      @artist
    end
  end

end
