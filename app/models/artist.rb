class Artist < ActiveRecord::Base
  has_many :songs
  # has_many :genres

  def slug
  slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  slug
  end

  def self.find_by_slug(slug)
    @@all.each do |song|
      if artist.name.slug == slug
        return song
      end
    end
  end
end
