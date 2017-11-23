class Song < ActiveRecord::Base
  include Slugifiable
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def self.find_by_slug(slug)
    self.find_by(name: "#{slug.titleize.gsub("-", " ")}")
  end
end
