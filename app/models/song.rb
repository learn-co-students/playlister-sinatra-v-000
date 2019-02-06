class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    self.name.strip.downcase.gsub /\W+/, '-'
  end

  def self.find_by_slug(slug)
    self.find {|obj| obj.slug == slug}
  end
end
