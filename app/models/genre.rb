class Genre < ActiveRecord::Base
  has_many :genres_songs
  has_many :songs, through: :genres_songs
  has_many :artists, through: :songs

  def slug
    slug = self.name.gsub(/[\u0080-\u00ff]/, "").gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    found = nil
    self.all.each do |genre|
      if genre.slug == slug
        found = genre
      end
    end
    found
  end
end
