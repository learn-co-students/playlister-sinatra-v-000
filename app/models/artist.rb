class Artist < ActiveRecord::Base
  has_many :genres, through: :songs
  has_many :songs

  def slug
  slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  slug
  end

  def self.find_by_slug(slug)
    all.each do |artist|
      if artist.slug == slug
        return artist
      end
    end
  end
end
