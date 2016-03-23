class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    name.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|inst| inst.slug == slug}
  end

end