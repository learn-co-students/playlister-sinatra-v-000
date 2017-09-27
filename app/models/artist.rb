class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(search_slug)
    self.all.each do |artist|
      if artist.slug == search_slug
        return artist
      end
    end
  end

end
