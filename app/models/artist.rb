class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    sluged_artist = ""
  
    self.all.each do |artist|
      if artist.slug == slug
         sluged_artist = artist
      end

    end
      sluged_artist
  end

end
