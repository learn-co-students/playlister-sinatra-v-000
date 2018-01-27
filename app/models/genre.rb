class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
  slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  slug
  end

  def self.find_by_slug(slug)
    all.each do |genre|
      if genre.slug == slug
        return song
      end
    end
  end
end
