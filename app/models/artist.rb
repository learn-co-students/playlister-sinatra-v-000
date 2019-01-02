class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  # refactor to module
  def slug
    self.name.gsub(/\s/, "-").gsub(/[^0-9A-Za-z\-]/, '').downcase
  end

  # doesn't add special characters back in and causes error
  def self.find_by_slug(slug)
    self.find do |artist|
      artist.name == slug.split(/\-/).map(&:capitalize).join(" ")
    end
  end
end
