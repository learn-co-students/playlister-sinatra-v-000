class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    artist_name = self.name
    slug = artist_name.downcase.strip.gsub(' ', '-')
  end

  def find_by_slug(slug)
    slug.find_by do |name|
      name.slug

    end
  end
end
