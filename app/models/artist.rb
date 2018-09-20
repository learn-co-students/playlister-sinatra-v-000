class Artist < ActiveRecord::Base
  include Models::Concerns::Slug
  has_many :songs
  has_many :genres, through: :songs

  def slug(name)
    name.slug
  end

  def find_by_slug
    self.slug
  end
end
