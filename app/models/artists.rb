class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    if self.name != nil
      self.name.downcase.gsub(" ", "-")
    end

  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end

end
