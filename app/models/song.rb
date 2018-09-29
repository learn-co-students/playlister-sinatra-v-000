class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    slug = self.name.gsub(' ', '-').gsub(/[^\w-]/, '').gsub(/(-){2,}/, '-').downcase
    slug
  end

  def self.find_by_slug(slug)
    self.all.detect {|song| song.slug == slug}
  end
end
