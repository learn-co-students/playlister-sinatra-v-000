class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    self.all.detect do |x|

      x if x.slug == slug

    end
  end

end