class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    @slug = self.name.downcase
    if @slug.split.size >1
      @slug.split.join("-")
    end
  end

  def self.find_by_slug(slug)
    @genre = Genre.all.find do |g|
      g.slug == slug
    end
  end
end
