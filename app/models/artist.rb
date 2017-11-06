class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split.join("-").downcase
  end

  def self.find_by_slug(slug_name)
    Artist.all.each do |artist|
      if artist.slug == slug_name
        return artist
      end
    end
  end

end
