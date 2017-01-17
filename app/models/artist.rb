class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs

def slug
    self.name.squish.downcase.tr(" ","-")
  end

  def self.find_by_slug(slug)
    found = nil
    Artist.all.each do |artist|
        found = artist if artist.slug == slug
    end
    found
  end
  
end
