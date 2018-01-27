class Artist < ActiveRecord::Base
  has_many :songs
  # has_many :genres

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
