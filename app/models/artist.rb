class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(/\W/).reject { |w| w.empty? }.join("-")
  end

  def self.find_by_slug(slug)
    # use FIND method to find artist from Artist.all whos slug == slug argument provided
    Artist.all.find{|artist| artist.slug == slug}
  end
end
