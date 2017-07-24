class Genre<ActiveRecord::Base
  has_many :songs, :through => :song_genres
  has_many :song_genres
  has_many :artists, :through => :songs

  def slug
    self.name.downcase.gsub(/\s+/, '-')
  end

  def self.find_by_slug(slug)
    Genre.all.find do |genre|
      if genre.slug == slug
        genre
      end
    end
  end
end
