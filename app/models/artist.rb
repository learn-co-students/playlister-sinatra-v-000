class Artist < ActiveRecord::Base
  include Slug
  has_many :songs
  has_many :genres, through: :songs

  attr accessor :name

  def create(name)
    @artist = Artist.new
    @artist.save
  end

  def slug(name)
    name.slug
  end

  def find_by_slug
    self.slug
  end
end
