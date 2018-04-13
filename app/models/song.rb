class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    @slug = self.name.downcase
    if @slug.split.size >1
      @slug.split.join("-")
    end
  end

  def self.find_by_slug(slug)
    @song = Song.all.find do |s|
      s.slug == slug
    end
  end
end
