class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs #:songs is the intermediary that connects artist to genre

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    @artist = self.all.find{|artist| artist.slug == slug}
  end

end
