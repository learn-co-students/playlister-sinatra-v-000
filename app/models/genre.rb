class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs


  def slug
    self.name.ljust(100).strip.gsub(/[\s\t\r\n\f]/,'-').gsub(/\W/,'-').downcase
  end

  def self.find_by_slug(slug)
    self.find do |s|
      s.slug == slug
    end
  end
end
