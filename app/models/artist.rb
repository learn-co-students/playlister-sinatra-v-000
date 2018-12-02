class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs



  def slug
    self.name.downcase.strip.gsub(' ', '-')
  end


  def self.find_by_slug(slug_version)
    self.all.each do |artist|
      if artist.slug == slug_version
        return artist
      end
    end
  end

end
