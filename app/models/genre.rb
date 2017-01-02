class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  has_many :song_genres

  def slug
    self.name.downcase.strip.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    self.all.each do |s|
      if s.slug == slug
        return s
      end
    end
  end
end
