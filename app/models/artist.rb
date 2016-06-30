class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  def self.find_by_slug(slug)
    slug = slug.gsub(-, " ")
    binding.pry
  end
end
