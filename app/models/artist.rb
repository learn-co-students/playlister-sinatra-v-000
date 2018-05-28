class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  # should move this logic to a module maybe
  def slug ()
    name = self.read_attribute(:name)
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug (slug)
    self.all.find { |artist| artist.slug == slug }
  end

end
