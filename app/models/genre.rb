class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map(&:capitalize).join(' ')
    self.all.detect { |a| a.name == name }
  end
end
