class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    # name = slug.split("-").map(&:capitalize).join(' ')
    # self.find_by(:name => name)
    self.all.select do |song|
      song.slug == slug
    end.first

  end


end
