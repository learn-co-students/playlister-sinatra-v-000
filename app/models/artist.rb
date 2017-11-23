class Artist < ActiveRecord::Base
  include Slugifiable
  has_many :genres, through: :songs
  has_many :songs

  def self.find_by_slug(slug)
    # binding.pry
    self.find_by(name: "#{slug.titleize.gsub("-", " ")}")
  end
end
