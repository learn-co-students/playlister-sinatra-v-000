class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

  def slug
    if self.name
      slugger = self.name.gsub(' ','-').downcase
      @slug = slugger.gsub(/^[-]\W\(\)/,'')
      self.slug = @slug
      @slug

    end
  end

  def self.find_by_slug(slug)
    Song.all.find do |song|
      song.slug == slug
    end
  end
end
