
class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    name = []
    slug.split("-").each {|w| name << w.capitalize}
    find_by(name: name.join(" "))
  end

end
