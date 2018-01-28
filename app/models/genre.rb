class Genre < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
  slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  slug
  end

  def self.find_by_slug(slug)
    all.each do |genre|
      if genre.slug == slug
        return genre
      end
    end
  end
end
