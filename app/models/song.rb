class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    converted_slug = slug.split("-").join(" ").titleize
    self.all.find{|song| song.name == converted_slug}
  end

end
