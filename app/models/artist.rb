class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    @slug = name.gsub(/[^\s\w]/, '').gsub(/\s{1,}/, '-').downcase
  end

  def self.find_by_slug(slug)
    Artist.all.detect{|artist| artist.slug == slug}
  end
end
