class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :song_genres, :source => :song


  def slug
    @slug = self.name.gsub(" ", "-").downcase
    @slug
  end

  def self.find_by_slug(slug)
    Genre.all.each do |genre|
      if genre.slug == slug
        return genre
      end
    end
  end

end
