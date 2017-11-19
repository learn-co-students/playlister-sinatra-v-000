class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    binding.pry
  end

  def slug
    self.name.gsub(/\W/,"-").downcase
 end

end
