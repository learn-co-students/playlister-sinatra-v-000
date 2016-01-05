require "pry"
class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(" ", "-")
  end

  def self.normalize_slug(slug)
    slug.split("-").map(&:capitalize).join(" ")
  end

  def self.find_by_slug(slug)
    self.all.find { |artist| artist.name == normalize_slug(slug) }
  end


end