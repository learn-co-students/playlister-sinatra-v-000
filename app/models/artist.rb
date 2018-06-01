class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.downcase.gsub!(/\W|( )/, "-") if self.is_a?(String)
  end

  def self.find_by_slug(slug)
    self.all.find do |artist|
      artist.slug == slug
    end
  end
end