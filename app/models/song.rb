class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map(&:capitalize).join(' ')
    self.all.detect { |a| a.name == name }
  end
end
