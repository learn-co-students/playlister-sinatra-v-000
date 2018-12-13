class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    #slug_name = self.name
    #slug_name.downcase.gsub(" ","-")
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end

end
