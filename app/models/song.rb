class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(/[^0-9A-Za-z]/, '-').downcase
  end

  def self.find_by_slug(slug)
    @deslugged = slug.gsub('-', " ").split.map(&:capitalize).join(' ')
    self.all.find {|song| song.name == @deslugged}
  end
end
