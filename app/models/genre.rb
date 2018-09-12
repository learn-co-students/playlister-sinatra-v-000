class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    genre_name = name.gsub(" ", "-").downcase
    # self.gsub(/^(.*) - /, "").gsub(/\[([^\]]*)\].*/, "")
  end

  def self.find_by_slug(slug)
    genre_name = slug.split("-").map(&:capitalize).join(' ')
    genre = self.find_by(name: genre_name)
  end
end
