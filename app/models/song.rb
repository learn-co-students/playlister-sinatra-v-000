class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres_songs
  has_many :genres, through: :genres_songs

  def slug
    slug = self.name.gsub(/[\u0080-\u00ff]/, "").gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    found = nil
    self.all.each do |song|
      if song.slug == slug
        found = song
      end
    end
    found
  end
end
