class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    #Taylor Swift -> taylor-swift
    name.downcase.gsub(" ", "-") unless name.nil?
  end

  def self.find_by_slug(slug)
    Artist.all.find do |artist|
      artist.slug == slug
    end
  end
end
