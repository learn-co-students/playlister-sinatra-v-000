class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.gsub(" ", "-") unless name.nil?
  end

  def self.find_by_slug(slug)
    Genre.all.find do |genre|
      genre.slug == slug
    end
  end
end
