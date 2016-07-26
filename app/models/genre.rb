class Genre < ActiveRecord::Base
  has_and_belongs_to_many :songs
  has_many :artists, through: :songs

  include Slugifiable

  def self.find_by_slug(slug)
    name = slug.split("-").map { |name| name.capitalize }.join(" ")
    self.find_by_name(name)
  end
  
end
